import 'dart:math';

class WordsDB {
  static final words = <String>[
    'ADMIT',
    'ADOPT',
    'AGREE',
    'ALLOW',
    'ALTER',
    'APPLY',
    'ARGUE',
    'ARISE',
    'AVOID',
    'BEGIN',
    'BLAME',
    'BREAK',
    'BRING',
    'BUILD',
    'BURST',
    'CARRY',
    'CATCH',
    'CAUSE',
    'CHECK',
    'CLAIM',
    'CLEAN',
    'CLEAR',
    'CLIMB',
    'CLOSE',
    'COUNT',
    'COVER',
    'CROSS',
    'DANCE',
    'DOUBT',
    'DRINK',
    'DRIVE',
    'ENJOY',
    'ENTER',
    'EXIST',
    'FIGHT',
    'FOCUS',
    'FORCE',
    'GUESS',
    'IMPLY',
    'ISSUE',
    'JUDGE',
    'LAUGH',
    'LEARN',
    'LEAVE',
    'LET’S',
    'LIMIT',
    'MARRY',
    'MATCH',
    'OCCUR',
    'OFFER',
    'ORDER',
    'PHONE',
    'PLACE',
    'POINT',
    'PRESS',
    'PROVE',
    'RAISE',
    'REACH',
    'REFER',
    'RELAX',
    'SERVE',
    'SHALL',
    'SHARE',
    'SHIFT',
    'SHOOT',
    'SLEEP',
    'SOLVE',
    'SOUND',
    'SPEAK',
    'SPEND',
    'SPLIT',
    'STAND',
    'START',
    'STATE',
    'STICK',
    'STUDY',
    'TEACH',
    'THANK',
    'THINK',
    'THROW',
    'TOUCH',
    'TRAIN',
    'TREAT',
    'TRUST',
    'VISIT',
    'VOICE',
    'WASTE',
    'WATCH',
    'WORRY',
    'WOULD',
    'WRITE',
    'ABOVE',
    'ACUTE',
    'ALIVE',
    'ALONE',
    'ANGRY',
    'AWARE',
    'AWFUL',
    'BASIC',
    'BLACK',
    'BLIND',
    'BRAVE',
    'BRIEF',
    'BROAD',
    'BROWN',
    'CHEAP',
    'CHIEF',
    'CIVIL',
    'CLEAN',
    'CLEAR',
    'CLOSE',
    'CRAZY',
    'DAILY',
    'DIRTY',
    'EARLY',
    'EMPTY',
    'EQUAL',
    'EXACT',
    'EXTRA',
    'FAINT',
    'FALSE',
    'FIFTH',
    'FINAL',
    'FIRST',
    'FRESH',
    'FRONT',
    'FUNNY',
    'GIANT',
    'GRAND',
    'GREAT',
    'GREEN',
    'GROSS',
    'HAPPY',
    'HARSH',
    'HEAVY',
    'HUMAN',
    'IDEAL',
    'INNER',
    'JOINT',
    'LARGE',
    'LEGAL',
    'LEVEL',
    'LIGHT',
    'LOCAL',
    'LOOSE',
    'LUCKY',
    'MAGIC',
    'MAJOR',
    'MINOR',
    'MORAL',
    'NAKED',
    'NASTY',
    'NAVAL',
    'OTHER',
    'OUTER',
    'PLAIN',
    'PRIME',
    'PRIOR',
    'PROUD',
    'QUICK',
    'QUIET',
    'RAPID',
    'READY',
    'RIGHT',
    'ROMAN',
    'ROUGH',
    'ROUND',
    'ROYAL',
    'RURAL',
    'SHARP',
    'SHEER',
    'SHORT',
    'SILLY',
    'SIXTH',
    'SMALL',
    'SMART',
    'SOLID',
    'SORRY',
    'SPARE',
    'STEEP',
    'STILL',
    'SUPER',
    'SWEET',
    'THICK',
    'THIRD',
    'TIGHT',
    'TOTAL',
    'TOUGH',
    'UPPER',
    'UPSET',
    'URBAN',
    'USUAL',
    'VAGUE',
    'VALID',
    'VITAL',
    'WHITE',
    'WHOLE',
    'WRONG',
    'YOUNG'
  ];
  String? currentWord;

  String get nextWord {
    final index = Random().nextInt(words.length);
    currentWord = words[index];
    return currentWord!;
  }
}
