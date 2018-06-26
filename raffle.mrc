;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;; POINTS RAFFLE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ON $*:TEXT:/^!raffle\s(end|\d+(\s\d+\s\d+)?)$/iS:%mychan: {
  IF ($isEditor) {
    IF (($2 isnum) && (!%raffle.active)) {
      SET %raffle.active On
      SET %raffle.cost $2
      IF (($3) && ($4)) {
        SET %raffle.max.entries $3
        SET %raffle.timer $4
        VAR %raffle.msg The raffle will automatically close after %raffle.max.entries entries or $IIF($regex($calc($4 / 30),^\d+$),$calc($4 / 60) minutes,$4 seconds) $+ $chr(44) whichever comes first.
      }
      MSG $chan KAPOW A $upper($mid(%curname,1,1)) $+ $mid(%curname,2-) raffle has been started in the channel! The entry fee is %raffle.cost %curname $+ ! The winner will receive all the %curname that are entered into the raffle! To enter, simply type !raffle in chat. %raffle.msg
      IF ($4) .timer.raffle.end 1 %raffle.timer endraffle
    }
    ELSEIF (($2 == end) && (%raffle.active)) endraffle
  }
}

ON $*:TEXT:/^!raffle$/iS:%mychan: {
  IF ((%raffle.active) && (!$istok(%raffle.entries,$nick,32))) {
    IF ($GetPoints($nick) < %raffle.cost) {
      IF (!$($+(%,flood2poor4raffle.,$nick),2)) {
        SET -eu60 %flood2poor4raffle. $+ $nick On
        $wdelay(MSG $nick You do not have %raffle.cost %curname to enter the %curname raffle!  FeelsBadMan)
      }
    }
    ELSE {
      SET %raffle.entries %raffle.entries $nick
      REMOVEPOINTS $nick %raffle.cost
      $wdelay(MSG $nick You have entered %raffle.cost %curname into the %curname raffle!  Good luck!)
      IF ((%raffle.max.entries) && ($numtok(%raffle.entries,32) >= %raffle.max.entries)) endraffle
    }
  }
}

alias -l entries {
  VAR %x = 1
  WHILE ($gettok(%raffle.entries,%x,32)) {
    VAR %names %names $v1 $+ $chr(44)
    INC %x
  }
  RETURN $left($sorttok(%names,32,a),-1)
}

alias -l endraffle {
  IF ($timer(.raffle.end)) .timer.raffle.end off
  UNSET %raffle.active
  IF ($numtok(%raffle.entries,32) == 0) { MSG %mychan Wow! Nobody entered the %curname raffle! Nobody wins! FeelsBadMan | UNSET %raffle.* }
  ELSEIF ($numtok(%raffle.entries,32) == 1) { MSG %mychan Wow! Only %raffle.entries entered the %curname raffle! %raffle.entries just got their %raffle.cost %curname back! | ADDPOINTS %raffle.entries %raffle.cost | UNSET %raffle.* }
  ELSE {
    MSG %mychan The $upper($mid(%curname,1,1)) $+ $mid(%curname,2-) raffle is now closed! Good luck to all $numtok(%raffle.entries,32) people who entered: $entries
    VAR %raffle.total $calc(%raffle.cost * $numtok(%raffle.entries,32))
    VAR %raffle.winner $gettok(%raffle.entries, $rand(1, $numtok(%raffle.entries, 32)), 32)
    .timer.raffle.1 1 6 MSG %mychan I am now choosing a winner at random!
    .timer.raffle.2 1 12 MSG %mychan Congratulations to %raffle.winner who just won %raffle.total %curname in the $upper($mid(%curname,1,1)) $+ $mid(%curname,2-) raffle!
    .timer.raffle.3 1 12 ADDPOINTS %raffle.winner %raffle.total
    .timer.raffle.4 1 12 UNSET %raffle.*
  }
}