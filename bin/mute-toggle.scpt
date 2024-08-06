if (input volume of (get volume settings)) < 90 then
  set volume input volume 90
  do shell script "afplay '/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/system/mic_unmute.caf'"
  do shell script "open 'xbar://app.xbarapp.com/refreshPlugin?path=mute-indicator.1d.sh'"
else
  set volume input volume 0
  do shell script "afplay '/System/Library/Components/CoreAudio.component/Contents/SharedSupport/SystemSounds/system/mic_mute.caf'"
  do shell script "open 'xbar://app.xbarapp.com/refreshPlugin?path=mute-indicator.1d.sh'"
end if
