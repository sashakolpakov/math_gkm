"""Closed inspection presets. Catalogue capacity is an explicit controller choice.

This source-only candidate does not select or activate a larger preset.
No protocol, proposal, result record or command-line value defines a quota.
"""
from dataclasses import dataclass
from types import MappingProxyType
from .study_common import Invalid

SCHEMA = 'math-gkm.inspection-profile.v1'
DEFAULT_ID = 'ordinary-v3'
CATALOGUE_ID = 'catalogue-2m-128mib-v1'
NODE_ONLY_CATALOGUE_ID = 'catalogue-2m-64mib-v1'
CAPACITY_CATALOGUE_ID = 'catalogue-4m-256mib-v1'


@dataclass(frozen=True)
class Profile:
    id: str
    node_limit: int
    artifact_bytes: int
    catalogue: bool = False

    @property
    def inspection_schema(self):
        return 'math-gkm.inspection-dag.catalogue.v1' if self.catalogue else 'math-gkm.inspection-dag.v3'

    @property
    def completion_schema(self):
        return 'math-gkm.producer-completion.catalogue.v1' if self.catalogue else 'math-gkm.producer-completion.v3'

    def binding(self):
        return dict(schema=SCHEMA, id=self.id, expression_node_limit=self.node_limit,
                    artifact_bytes=self.artifact_bytes, line_bytes=1024**2,
                    expression_depth=4096, declarations=200000,
                    dependency_nodes=200000, dependency_edges=2000000)


PRESETS = MappingProxyType({
    DEFAULT_ID: Profile(DEFAULT_ID, 1000000, 64*1024**2),
    CATALOGUE_ID: Profile(CATALOGUE_ID, 2000000, 128*1024**2, True),
    NODE_ONLY_CATALOGUE_ID: Profile(NODE_ONLY_CATALOGUE_ID, 2000000, 64*1024**2, True),
    CAPACITY_CATALOGUE_ID: Profile(CAPACITY_CATALOGUE_ID, 4000000, 256*1024**2, True),
})


def resolve(profile_id=None):
    """Accept preset identifiers only; caller values never define limits."""
    if profile_id is None:
        profile_id = DEFAULT_ID
    if type(profile_id) is not str or profile_id not in PRESETS:
        raise Invalid('unknown inspection profile')
    return PRESETS[profile_id]


def validate_binding(value, profile_id=None):
    profile = resolve(profile_id)
    if not isinstance(value, dict) or value != profile.binding():
        raise Invalid('inspection profile binding changed')
    # Equality alone treats True as 1; require exact canonical primitive types.
    if any(type(value[k]) is not type(v) for k, v in profile.binding().items()):
        raise Invalid('invalid inspection profile field types')
    return profile


def from_result(result, profile_id=None):
    """Validate against controller-selected expected profile, never self-select."""
    profile = resolve(profile_id)
    if 'inspection_profile' not in result and not profile.catalogue:
        return profile  # historical ordinary v3 evidence only
    return validate_binding(result.get('inspection_profile'), profile.id)


def catalogue_selection(profile_id, *, task, solution, replay_engine):
    """Only the existing frozen own-catalogue replay route may select a preset."""
    profile = resolve(profile_id)
    if profile.catalogue and (replay_engine is None or task.get('id') != 'catalog'
            or not isinstance(solution, dict) or solution.get('module') != 'MathGKM.FrozenCatalog'
            or not isinstance(task.get('context_modules'), list) or not task['context_modules']
            or task['context_modules'][0] != 'MathGKM.FrozenCatalog'):
        raise Invalid('inspection profile is restricted to the frozen own catalogue')
    return profile
