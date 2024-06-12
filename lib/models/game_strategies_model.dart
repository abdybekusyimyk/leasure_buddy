class GameStrategiesModel {
  GameStrategiesModel(
      {required this.title,
      required this.description,
      required this.strategiesDetailModel});

  final String title;
  final String description;
  final GameStrategiesDetailModel strategiesDetailModel;
}

class GameStrategiesDetailModel {
  GameStrategiesDetailModel({
    required this.image,
    required this.text,
  });

  final String image;
  final String text;
}

final List<GameStrategiesModel> gameStrategies = [
  GameStrategiesModel(
    title: 'How to Play Craps',
    description:
        'Craps is a fast-moving casino table game. An average speed at a busy blackjack table runs around 60 hands per hour, but the house expects about 100 decisions per hour at craps. Learn how to play.',
    strategiesDetailModel: GameStrategiesDetailModel(
      image: 'assets/images/craps-scaled.jpeg',
      text:
          '''Even blindfolded in a crowded casino, anyone can find the craps table when the dice are hot. Just follow the screams, shouts, and cheers. Jackpot winners on slot machines may be the loudest individuals in the house, but nothing is quite like the collective excitement that builds at a craps table. Whereas blackjack players are quiet studies in concentration, craps players let loose as they win or lose together.
Conversely, nothing is quite as dead as a craps table when the dice are cold. At peak hours, when you see three or four somber individuals at the big table for 24, you can be sure the loser 7s have been coming up all too frequently.
Craps is the fastest-moving of casino table games. An average speed at a busy blackjack table runs around 60 hands per hour, but the house expects about 100 decisions per hour at craps. That, along with the tendency of craps players to have several bets working at once, means that craps requires a larger bankroll than other table games. And craps offers the widest variety of bets in the casino, with dozens of wagering options on the table.
All this can be pretty intimidating to a newcomer. But casino games were not designed to chase customers away, and craps is easier than it looks at first glance. Yes, there are an enormous number of bets available, but only a few are really worth playing. And those few are among the best bets in the casino. In this article, we'll discuss the fundamentals of craps, as well as the wide variety of bets and which ones to place at the right times to increase your odds of winning. We will begin with the layout of the table and the common terminology used for a game.
The Table and PersonnelMost craps tables today are double layouts. At the center of one side of the table is the boxman, who supervises the game and takes cash collected by the dealers and deposits it in a drop box. Directly opposite him is the stickman, who uses a stick to push the dice to the shooter. The stickman controls the tempo of the game. He calls out the results of each roll and keeps up a continuous patter, urging players to get their bets down.
At the center of the table between the boxman and stickman are boxes for proposition bets -- one-roll bets. Also here are areas for hard-way bets -- betting that a 6, for example, will be rolled as two 3s before either a 7 or any other 6 is rolled.''',
    ),
  ),
  GameStrategiesModel(
    title: 'How to Play Blackjack',
    description:
        'Of all the casino games, blackjack is the one that is actually possible to beat. As a result, blackjack is by far the most popular table game in the United States. Learn how to play.',
    strategiesDetailModel: GameStrategiesDetailModel(
      image: 'assets/images/Gaming-Blackjack.jpeg',
      text:
          '''Even blindfolded in a crowded casino, anyone can find the craps table when the dice are hot. Just follow the screams, shouts, and cheers. Jackpot winners on slot machines may be the loudest individuals in the house, but nothing is quite like the collective excitement that builds at a craps table. Whereas blackjack players are quiet studies in concentration, craps players let loose as they win or lose together.
Conversely, nothing is quite as dead as a craps table when the dice are cold. At peak hours, when you see three or four somber individuals at the big table for 24, you can be sure the loser 7s have been coming up all too frequently.
Craps is the fastest-moving of casino table games. An average speed at a busy blackjack table runs around 60 hands per hour, but the house expects about 100 decisions per hour at craps. That, along with the tendency of craps players to have several bets working at once, means that craps requires a larger bankroll than other table games. And craps offers the widest variety of bets in the casino, with dozens of wagering options on the table.
All this can be pretty intimidating to a newcomer. But casino games were not designed to chase customers away, and craps is easier than it looks at first glance. Yes, there are an enormous number of bets available, but only a few are really worth playing. And those few are among the best bets in the casino. In this article, we'll discuss the fundamentals of craps, as well as the wide variety of bets and which ones to place at the right times to increase your odds of winning. We will begin with the layout of the table and the common terminology used for a game.
The Table and PersonnelMost craps tables today are double layouts. At the center of one side of the table is the boxman, who supervises the game and takes cash collected by the dealers and deposits it in a drop box. Directly opposite him is the stickman, who uses a stick to push the dice to the shooter. The stickman controls the tempo of the game. He calls out the results of each roll and keeps up a continuous patter, urging players to get their bets down.
At the center of the table between the boxman and stickman are boxes for proposition bets -- one-roll bets. Also here are areas for hard-way bets -- betting that a 6, for example, will be rolled as two 3s before either a 7 or any other 6 is rolled.''',
    ),
  ),
  GameStrategiesModel(
    title: 'How to Play Roulette',
    description:
        '''Roulette is a game of pure chance that doesn't require skill. The key is to know how to bet and when to cut your losses before the wheel stops. Learn how to play roulette. Learn how to play.''',
    strategiesDetailModel: GameStrategiesDetailModel(
      image: 'assets/images/Roulette.jpeg',
      text:
          '''Even blindfolded in a crowded casino, anyone can find the craps table when the dice are hot. Just follow the screams, shouts, and cheers. Jackpot winners on slot machines may be the loudest individuals in the house, but nothing is quite like the collective excitement that builds at a craps table. Whereas blackjack players are quiet studies in concentration, craps players let loose as they win or lose together.
Conversely, nothing is quite as dead as a craps table when the dice are cold. At peak hours, when you see three or four somber individuals at the big table for 24, you can be sure the loser 7s have been coming up all too frequently.
Craps is the fastest-moving of casino table games. An average speed at a busy blackjack table runs around 60 hands per hour, but the house expects about 100 decisions per hour at craps. That, along with the tendency of craps players to have several bets working at once, means that craps requires a larger bankroll than other table games. And craps offers the widest variety of bets in the casino, with dozens of wagering options on the table.
All this can be pretty intimidating to a newcomer. But casino games were not designed to chase customers away, and craps is easier than it looks at first glance. Yes, there are an enormous number of bets available, but only a few are really worth playing. And those few are among the best bets in the casino. In this article, we'll discuss the fundamentals of craps, as well as the wide variety of bets and which ones to place at the right times to increase your odds of winning. We will begin with the layout of the table and the common terminology used for a game.
The Table and PersonnelMost craps tables today are double layouts. At the center of one side of the table is the boxman, who supervises the game and takes cash collected by the dealers and deposits it in a drop box. Directly opposite him is the stickman, who uses a stick to push the dice to the shooter. The stickman controls the tempo of the game. He calls out the results of each roll and keeps up a continuous patter, urging players to get their bets down.
At the center of the table between the boxman and stickman are boxes for proposition bets -- one-roll bets. Also here are areas for hard-way bets -- betting that a 6, for example, will be rolled as two 3s before either a 7 or any other 6 is rolled.''',
    ),
  ),
  GameStrategiesModel(
    title: 'How to Play Video Poker',
    description:
        '''Video poker adds an aspect that slot machines don't offer -- the elements of skill and challenge. Players have decisions to make that can affect the outcome of the game. Learn how to play.''',
    strategiesDetailModel: GameStrategiesDetailModel(
      image: 'assets/images/tro-choi-poker.png',
      text:
          '''Even blindfolded in a crowded casino, anyone can find the craps table when the dice are hot. Just follow the screams, shouts, and cheers. Jackpot winners on slot machines may be the loudest individuals in the house, but nothing is quite like the collective excitement that builds at a craps table. Whereas blackjack players are quiet studies in concentration, craps players let loose as they win or lose together.
Conversely, nothing is quite as dead as a craps table when the dice are cold. At peak hours, when you see three or four somber individuals at the big table for 24, you can be sure the loser 7s have been coming up all too frequently.
Craps is the fastest-moving of casino table games. An average speed at a busy blackjack table runs around 60 hands per hour, but the house expects about 100 decisions per hour at craps. That, along with the tendency of craps players to have several bets working at once, means that craps requires a larger bankroll than other table games. And craps offers the widest variety of bets in the casino, with dozens of wagering options on the table.
All this can be pretty intimidating to a newcomer. But casino games were not designed to chase customers away, and craps is easier than it looks at first glance. Yes, there are an enormous number of bets available, but only a few are really worth playing. And those few are among the best bets in the casino. In this article, we'll discuss the fundamentals of craps, as well as the wide variety of bets and which ones to place at the right times to increase your odds of winning. We will begin with the layout of the table and the common terminology used for a game.
The Table and PersonnelMost craps tables today are double layouts. At the center of one side of the table is the boxman, who supervises the game and takes cash collected by the dealers and deposits it in a drop box. Directly opposite him is the stickman, who uses a stick to push the dice to the shooter. The stickman controls the tempo of the game. He calls out the results of each roll and keeps up a continuous patter, urging players to get their bets down.
At the center of the table between the boxman and stickman are boxes for proposition bets -- one-roll bets. Also here are areas for hard-way bets -- betting that a 6, for example, will be rolled as two 3s before either a 7 or any other 6 is rolled.''',
    ),
  ),
  GameStrategiesModel(
    title: 'How to Play Slot Machines',
    description:
        '''Slot machines are more popular than table games at casinos — the personal interaction with dealers at the tables is often intimidating to some. On the slots, it's just you and the machine. Learn how to play.''',
    strategiesDetailModel: GameStrategiesDetailModel(
      image: 'assets/images/machines.jpeg',
      text:
          '''Even blindfolded in a crowded casino, anyone can find the craps table when the dice are hot. Just follow the screams, shouts, and cheers. Jackpot winners on slot machines may be the loudest individuals in the house, but nothing is quite like the collective excitement that builds at a craps table. Whereas blackjack players are quiet studies in concentration, craps players let loose as they win or lose together.
Conversely, nothing is quite as dead as a craps table when the dice are cold. At peak hours, when you see three or four somber individuals at the big table for 24, you can be sure the loser 7s have been coming up all too frequently.
Craps is the fastest-moving of casino table games. An average speed at a busy blackjack table runs around 60 hands per hour, but the house expects about 100 decisions per hour at craps. That, along with the tendency of craps players to have several bets working at once, means that craps requires a larger bankroll than other table games. And craps offers the widest variety of bets in the casino, with dozens of wagering options on the table.
All this can be pretty intimidating to a newcomer. But casino games were not designed to chase customers away, and craps is easier than it looks at first glance. Yes, there are an enormous number of bets available, but only a few are really worth playing. And those few are among the best bets in the casino. In this article, we'll discuss the fundamentals of craps, as well as the wide variety of bets and which ones to place at the right times to increase your odds of winning. We will begin with the layout of the table and the common terminology used for a game.
The Table and PersonnelMost craps tables today are double layouts. At the center of one side of the table is the boxman, who supervises the game and takes cash collected by the dealers and deposits it in a drop box. Directly opposite him is the stickman, who uses a stick to push the dice to the shooter. The stickman controls the tempo of the game. He calls out the results of each roll and keeps up a continuous patter, urging players to get their bets down.
At the center of the table between the boxman and stickman are boxes for proposition bets -- one-roll bets. Also here are areas for hard-way bets -- betting that a 6, for example, will be rolled as two 3s before either a 7 or any other 6 is rolled.''',
    ),
  ),
  GameStrategiesModel(
    title: 'How Craps Works',
    description:
        '''If you’ve ever stepped foot in a casino, you’ve undoubtedly noticed the craps tables –- that’s where all the cheers are coming from. Learn how to play.''',
    strategiesDetailModel: GameStrategiesDetailModel(
      image: 'assets/images/casino-picture.jpeg',
      text:
          '''Even blindfolded in a crowded casino, anyone can find the craps table when the dice are hot. Just follow the screams, shouts, and cheers. Jackpot winners on slot machines may be the loudest individuals in the house, but nothing is quite like the collective excitement that builds at a craps table. Whereas blackjack players are quiet studies in concentration, craps players let loose as they win or lose together.
Conversely, nothing is quite as dead as a craps table when the dice are cold. At peak hours, when you see three or four somber individuals at the big table for 24, you can be sure the loser 7s have been coming up all too frequently.
Craps is the fastest-moving of casino table games. An average speed at a busy blackjack table runs around 60 hands per hour, but the house expects about 100 decisions per hour at craps. That, along with the tendency of craps players to have several bets working at once, means that craps requires a larger bankroll than other table games. And craps offers the widest variety of bets in the casino, with dozens of wagering options on the table.
All this can be pretty intimidating to a newcomer. But casino games were not designed to chase customers away, and craps is easier than it looks at first glance. Yes, there are an enormous number of bets available, but only a few are really worth playing. And those few are among the best bets in the casino. In this article, we'll discuss the fundamentals of craps, as well as the wide variety of bets and which ones to place at the right times to increase your odds of winning. We will begin with the layout of the table and the common terminology used for a game.
The Table and PersonnelMost craps tables today are double layouts. At the center of one side of the table is the boxman, who supervises the game and takes cash collected by the dealers and deposits it in a drop box. Directly opposite him is the stickman, who uses a stick to push the dice to the shooter. The stickman controls the tempo of the game. He calls out the results of each roll and keeps up a continuous patter, urging players to get their bets down.
At the center of the table between the boxman and stickman are boxes for proposition bets -- one-roll bets. Also here are areas for hard-way bets -- betting that a 6, for example, will be rolled as two 3s before either a 7 or any other 6 is rolled.''',
    ),
  ),
  GameStrategiesModel(
    title: 'How Blackjack Works',
    description:
        '''Blackjack (also known as "21") is one of the most popular casino games, at least partly because the rules are easy to grasp. There's one aim: Get as close to 21 as possible. Learn how to play.''',
    strategiesDetailModel: GameStrategiesDetailModel(
      image: 'assets/images/croupiers-at-casino.jpeg',
      text:
          '''Even blindfolded in a crowded casino, anyone can find the craps table when the dice are hot. Just follow the screams, shouts, and cheers. Jackpot winners on slot machines may be the loudest individuals in the house, but nothing is quite like the collective excitement that builds at a craps table. Whereas blackjack players are quiet studies in concentration, craps players let loose as they win or lose together.
Conversely, nothing is quite as dead as a craps table when the dice are cold. At peak hours, when you see three or four somber individuals at the big table for 24, you can be sure the loser 7s have been coming up all too frequently.
Craps is the fastest-moving of casino table games. An average speed at a busy blackjack table runs around 60 hands per hour, but the house expects about 100 decisions per hour at craps. That, along with the tendency of craps players to have several bets working at once, means that craps requires a larger bankroll than other table games. And craps offers the widest variety of bets in the casino, with dozens of wagering options on the table.
All this can be pretty intimidating to a newcomer. But casino games were not designed to chase customers away, and craps is easier than it looks at first glance. Yes, there are an enormous number of bets available, but only a few are really worth playing. And those few are among the best bets in the casino. In this article, we'll discuss the fundamentals of craps, as well as the wide variety of bets and which ones to place at the right times to increase your odds of winning. We will begin with the layout of the table and the common terminology used for a game.
The Table and PersonnelMost craps tables today are double layouts. At the center of one side of the table is the boxman, who supervises the game and takes cash collected by the dealers and deposits it in a drop box. Directly opposite him is the stickman, who uses a stick to push the dice to the shooter. The stickman controls the tempo of the game. He calls out the results of each roll and keeps up a continuous patter, urging players to get their bets down.
At the center of the table between the boxman and stickman are boxes for proposition bets -- one-roll bets. Also here are areas for hard-way bets -- betting that a 6, for example, will be rolled as two 3s before either a 7 or any other 6 is rolled.''',
    ),
  ),
  GameStrategiesModel(
    title: 'How Slot Machines Work',
    description:
        '''Slot machines may be computerized now, but they’re still the most popular gambling attraction at many casinos. While we can’t tell you how to improve your chances, we will explain how the... Learn how to play.''',
    strategiesDetailModel: GameStrategiesDetailModel(
      image: 'assets/images/how-casino-slot.jpeg',
      text:
          '''Even blindfolded in a crowded casino, anyone can find the craps table when the dice are hot. Just follow the screams, shouts, and cheers. Jackpot winners on slot machines may be the loudest individuals in the house, but nothing is quite like the collective excitement that builds at a craps table. Whereas blackjack players are quiet studies in concentration, craps players let loose as they win or lose together.
Conversely, nothing is quite as dead as a craps table when the dice are cold. At peak hours, when you see three or four somber individuals at the big table for 24, you can be sure the loser 7s have been coming up all too frequently.
Craps is the fastest-moving of casino table games. An average speed at a busy blackjack table runs around 60 hands per hour, but the house expects about 100 decisions per hour at craps. That, along with the tendency of craps players to have several bets working at once, means that craps requires a larger bankroll than other table games. And craps offers the widest variety of bets in the casino, with dozens of wagering options on the table.
All this can be pretty intimidating to a newcomer. But casino games were not designed to chase customers away, and craps is easier than it looks at first glance. Yes, there are an enormous number of bets available, but only a few are really worth playing. And those few are among the best bets in the casino. In this article, we'll discuss the fundamentals of craps, as well as the wide variety of bets and which ones to place at the right times to increase your odds of winning. We will begin with the layout of the table and the common terminology used for a game.
The Table and PersonnelMost craps tables today are double layouts. At the center of one side of the table is the boxman, who supervises the game and takes cash collected by the dealers and deposits it in a drop box. Directly opposite him is the stickman, who uses a stick to push the dice to the shooter. The stickman controls the tempo of the game. He calls out the results of each roll and keeps up a continuous patter, urging players to get their bets down.
At the center of the table between the boxman and stickman are boxes for proposition bets -- one-roll bets. Also here are areas for hard-way bets -- betting that a 6, for example, will be rolled as two 3s before either a 7 or any other 6 is rolled.''',
    ),
  ),
];
