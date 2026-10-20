# Monitor activation recipe: preparation only

Nothing in this document has installed a timer, enabled monitoring, sent a queue
message, or started research. The historical monitor remains untouched.

1. Finish the exact-source test review and root-authorized launcher activation.
   Confirm the new operator has an actual live handle. It may still be curating
   or freezing; that is setup, and missing arm state files are expected then.
2. Confirm this helper and instructions match the reviewed hashes, both plist
   files have the new distinct labels and `RunAtLoad=false`, `KeepAlive=false`,
   and the normal interval is 1800 seconds. The temporary validation interval is
   45 seconds and its final argument is `--validation-only`.
3. Configure only this new local `state.json`: set `thread_id` from the local
   `PREPARATION.json` authorized existing-conversation UUID, set `enabled=true`,
   retain `validation_done=false`. Preserve any existing pending tick and
   sequence rather than resetting or resending it. The initial prepared state
   has sequence zero and no pending tick. Remove only this new monitor's STOP.
   Do not print the UUID or publish PREPARATION/state/events. No new conversation
   is created. The helper validates a canonical UUID before any queue attempt.
4. Copy the reviewed plists to this user's LaunchAgents directory. Bootstrap
   the distinct normal and temporary validation labels in the current `gui/UID`
   domain. Do not kickstart a message immediately. The old monitor's plist and
   state must not be changed or restarted.
5. Root ends its current turn before the temporary timer first fires. Require a
   real delayed validation callback: queue attempt after root's final response,
   followed by the root's exact ack/done callbacks and visible acknowledgement in
   this same existing conversation, before any manual resume or observer message.
   No mathematical inspection is authorized by the validation callback.
6. After actual idle delivery is independently recorded, boot out and remove
   only the temporary idle-validation LaunchAgent. The normal timer requires
   validation_done and therefore cannot send ordinary status ticks beforehand.
   If delivery remains uncertain, retain its one pending record, do not resend,
   and report the delivery limitation. Queue exit zero alone is not proof that
   an idle conversation woke or the user received a report.
7. Subsequent ordinary callbacks are read-only status checks with the new helper.
   Complete the exact numbered ack/done callbacks, and deliver a compact report
   in this conversation. Do not contact a researcher or supply mathematical
   advice. Use terminal only after both arms and the authorized operator have
   closed with no required continuation pending.

Prepared source files:

- `monitor30m.py`: existing-thread queue, one outstanding callback, no automatic
  resend, bounded metadata logs, no research tools.
- `MONITOR_INSTRUCTIONS.md`: status/resource/admitted-evidence scope and limits.
- `org.sasha.math-gkm.concept-driver-20261020-monitor30m.plist`: normal timer.
- `org.sasha.math-gkm.concept-driver-20261020-monitor30m-idle-validation.plist`:
  temporary idle-delivery validation timer.
- `TEST_RESULT.json`: nine synthetic state-machine tests, zero real queue calls.

An operational observer may watch only new scheduler state and local process
metadata during this handoff. It must remain silent until successful idle
validation or the predeclared failure window so that its own notification cannot
masquerade as an idle wake. No timer guarantees delivery during sleep, daemon or
provider outage. The supervisor's owned caffeinate helps keep this host awake;
it is not evidence of delivery.
