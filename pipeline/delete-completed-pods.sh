oc delete pod --field-selector=status.phase==Succeeded -n project01
oc delete pod --field-selector=status.phase==Failed -n project01

