"""Explicit one-shot neutral qualification for an installed source revision.
No research, hosted model, study resume or retry is provided by this operator.
"""
import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import sys

PROGRAM = r"""
from pathlib import Path
import sys
from machinery.study_deployment import require_deployment
from machinery.study_common import canonical
binding=require_deployment(Path(sys.argv[1]), seconds=1740)
print(canonical(binding))
"""


def load_revision(path, pin):
    path=Path(path)
    if (not path.is_absolute() or path.resolve()!=path or not path.is_file() or
            hashlib.sha256(path.read_bytes()).hexdigest()!=pin):
        raise ValueError('reviewed revision source differs')
    spec=importlib.util.spec_from_file_location('qualified_prelaunch_revision',path)
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    return module


def execute(revision, config_path, config_pin, transaction, output, native_output, runner=None, admission=None):
    c=revision.load_config(config_path,config_pin)
    root=Path(c['root']);output=Path(output);native_output=Path(native_output)
    revision.need(output.is_absolute() and output.parent.resolve()==output.parent and
                  output.is_relative_to(root/'.bootstrap') and not output.exists(),
                  'fresh protected neutral output required')
    container=native_output.parent
    revision.need(native_output.is_absolute() and native_output.name=='native' and
                  container.parent==root/'.scratch' and container.parent.resolve()==container.parent and
                  container.resolve()==container and native_output.resolve()==native_output and
                  '.bootstrap' not in native_output.parts and not container.exists() and
                  not container.is_symlink() and not native_output.exists() and not native_output.is_symlink(),
                  'fresh canonical ROOT/.scratch/FRESH_CONTAINER/native output required')
    # Imports occur after the physical source installation, in this fresh owner.
    sys.path.insert(0,str(root))
    if runner is None:
        from machinery.process import run
        runner=run
    if admission is None:
        from machinery.study_deployment import reuse_deployment
        admission=reuse_deployment
    with revision.maintenance_fence(config_path,config_pin,transaction):
        output.mkdir(mode=0o700)
        container.mkdir(mode=0o700)  # The native preflight still receives an absent native_output.
        argv=['/opt/homebrew/bin/python3','-B','-c',PROGRAM,str(native_output)]
        env=dict(os.environ,PYTHONDONTWRITEBYTECODE='1',TMPDIR=str(container))
        revision.exclusive(output/'INTENT.json',revision.canonical({
            'schema':'math-gkm.neutral-revision-qualification.v1',
            'config_sha256':config_pin,'argv':argv,'native_output':str(native_output),'child_seconds':1740,
            'wrapper_seconds':1800,'hosted_model_calls':0,'research_launches':0,
            'scope':'Genuine unchanged native deployment preflight under installed exact sources; no retry'
        })+b'\n')
        result=runner(argv,cwd=root,env=env,timeout=1800,output_bytes=65536,
                      scope=container,tree_only=True)
        revision.exclusive(output/'OPERATION.json',revision.canonical(result)+b'\n')
        revision.need(type(result.get('returncode')) is int and result['returncode']==0 and
                      not result.get('termination') and not result.get('operationally_incomplete'),
                      'neutral child did not close successfully; no retry or finalization')
        binding=json.loads(result['stdout'])
        expected=native_output/'receipt.json'
        revision.need(isinstance(binding,dict) and binding.get('ready') is True and
                      binding.get('receipt')==str(expected) and
                      revision.sha(expected)==binding.get('receipt_sha256'),
                      'genuine neutral output binding missing')
        checked=admission(binding)
        revision.need(checked.get('ready') is True and checked.get('reused') is True,
                      'exact new-source neutral deployment was not admitted')
        row=revision.exclusive(output/'BINDING.json',revision.canonical(binding)+b'\n')
    # A post-yield source/history check can refuse the fence. Only a completed
    # context exit permits publication of this qualification, never its intent.
    revision.exclusive(output/'FINISHED.json',revision.canonical({
        'schema':'math-gkm.neutral-revision-qualification.v1','ready':True,
        'binding':row,'actual_numeric_exit_observed':True,'returncode':0,
        'operation_sha256':revision.sha(output/'OPERATION.json'),
        'config_sha256':config_pin,'native_output':str(native_output),'hosted_model_calls':0,'research_launches':0,
        'scope':'Neutral deployment only; no mathematical completion claim'
    })+b'\n')
    return row


def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--revision',type=Path,required=True)
    p.add_argument('--revision-sha256',required=True)
    p.add_argument('--config',type=Path,required=True)
    p.add_argument('--config-sha256',required=True)
    p.add_argument('--transaction',type=Path,required=True)
    p.add_argument('--out',type=Path,required=True)
    p.add_argument('--native-out',type=Path,required=True)
    a=p.parse_args()
    r=load_revision(a.revision,a.revision_sha256)
    result=execute(r,a.config,a.config_sha256,a.transaction,a.out,a.native_out)
    print(json.dumps(result,sort_keys=True))

if __name__=='__main__':main()
