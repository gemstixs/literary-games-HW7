VAR respect = 0
// based on how respectful you are to your coach, he'll congratulate you at the end of the game, and treat you differently during breaks. respect points of 5 or greater means he'll respect you.
VAR skill = 0
// based on how well you play, you'll get assurance that you'll stay on the team. however, no matter how well you play, if you aren't respectful to your coach you won't stay on the team. skill points of 5 or higher ensures a spot on the team.
VAR ENGL_goals = 0
VAR COMP_goals = 0
// goal counts for each team.

Alright rookie. Welcome to your first game in the UVA Inter-Department Hockey League. The English Department team is glad to have you. I'm your coach, Cody Inkman, and I'll be guiding you through the game.
+ Yes Coach.
~respect = respect + 1
    Good. You probably won't play many shifts, but just listen to what I tell you, skate hard, keep your head up, and you'll do great.
+ Sure, whatever. 
~respect = respect - 1
    Well kid, you already weren't gonna play many shifts, but with that attitude, you definitely won't. Just keep your motuh shut, your head up, skate hard, and maybe I'll keep you on this team.
- We play the Computer Science Department tonight. I know it's a rivalry game, but I want you to stay out of any fights. Just focus on your game. 
+ Yes Coach.
~respect = respect + 1
    Alright then. Let's hit the ice. 
+ Fine.
~respect = respect - 1
    Whatever kid. Let's hit the ice.
- You aren't on the starting line, so you sit on the bench for the first few minutes of the first period. Five minutes in, the score remains 0-0. 
+ (impatient) [Tell Coach to put you in.] Put me in. I can score.
~respect = respect - 1
What? No. I'll tell you when I'm putting you in.
    ++ Yes Coach.
    ++ (double_impatient) [Ask again.] Coach, I'm telling you, put me in and I'll score.
    -> benched
    // ends the game; diverts to "benched" knot, which then directly diverts to the "buzzer" knot.
+ [Wait your turn.] You wait a few more minutes, and still no goals, though both teams get a few solid shots off.
- Alright, {impatient: now} I'm sending you in. Remember, no fighting!
You jump over the boards, and as your skates hit the ice, you hurtle towards the puck. A player for the other team gets to it before you. 
That's a clean hit, rookie! Get the puck!
+ [Check him into the boards]You check the guy into the boards, and the puck pops free.
    ~skill = skill + 1
    He shoves you from behind, but you keep your balance. 
        ++ [Shove back] You hit him with your shoulder. -> instigator
        // diverts out of main weave to the "instigator" knot
        ++ [Ignore him]
             ~respect = respect + 1
+ [Try to steal the puck] You skate up right next to him, and try to steal the puck. He's got control of it though, and passes it away towards his teammate.
    ~skill = skill - 1
- One of your teammates snatches up the puck, and starts skating towards the other team's net. 
Turn around! Go get open!
You hustle down the ice, straight down the middle. Your teammate calls out to you, and passes the puck.  It hits the end of your stick, and suddenly, you're in front of the other team's goal, and you have the puck.
Rookie! Pass it back!
+ (assist)[Pass to your teammate] You pass the puck back to your teammate.
    ~skill = skill + 1
    ~respect = respect + 1
    He takes a slapshot from the middle of the circle, and the puck hits the back of the net! GOAL!
    ~ENGL_goals = ENGL_goals + 1
    Great shift rookie. Let's keep it up on the next one. 
+ (goal_greedy)[Shoot the puck] You're right in front of the net, and you take the shot. Their goalie catches it in his mit.
    ~respect = respect - 1
    C'mon, kid, your teammate was wide open! I told you what to do! Get off the ice, your shift's over. 
- You skate back to the bench. 
{goal_greedy: Next time, try to remember that this is a team sport.} {assist: Spectacular assist out there, kid. Let's see if you can snatch up a few more points out there.}
You're on the bench for the next few minutes. No goals are scored, but your team's defense is starting to look shaky. 
- (defense_shift) Ok. I'm sending you in for your next shift soon. Make sure you're helping out the defense, the Computer Science offense is heating up. Alright, go in!
You're on the ice, and the other team is racing towards your net with the puck.
+ [Let the defensemen handle it] You get to the top of your zone, and wait for the defensemen to clear the puck up to you.
 ~respect = respect - 1
    ROOKIE! MOVE! GET BACK ON D!
    ++ [Hustle back] You skate after the guy with the puck.
    ++ (bad_defense) [Stay up top] You stay where you are, and watch at your teammate fails to intercept a pass.
     ~respect = respect - 1
     You watch as your opponent takes the shot, and watch the puck hit the back of your net. Goal for Computer Science.
     ~COMP_goals = COMP_goals + 1
     -> benched
     // playing too disrespectfully ends the game; diverts to the "benched" knot which then directly diverts to the "buzzer" knot.
+ [Hustle back] You skate after the guy with the puck.
- You catch up to the guy with the puck. He's in the middle of the ice, and you're skating up behind him.
+ [Check him] You slam into his back, and he stumbles.
~respect = respect - 1
~skill = skill - 1
    What are you doing?!?!? You can't hit him on open ice!
    Luckily, -> luck
+ [Steal the puck without checking] You poke check him.
 ~respect = respect + 1
 ~skill = skill + 1
 Nice move!
 You watch as -> luck
- (luck) the puck slides free and out to your waiting teammate.
You start racing towards the other end of the ice, and your teammate passes you the puck. The only thing between the net and the puck is the goalie.
+ [Shoot top left corner] You shoot for the top left corner. 
+ [Shoot bottom right corner] You shoot for the bottom right corner. 
    {skill > 2: 
    Your shot hits the back of the net. 
    GOAL! Great shot rookie!
    ~respect = respect + 1
    ~skill = skill + 1
    -> buzzer
    }
    // if you made the right skill choices earlier and got an assist, you make the shot and get a bonus skill point.
+ [Go around the back of the net and try a Michigan] You skate around the back of the net, picking up speed, but when you try to pick the puck up on your stick to fire it in for the Michigan goal, you can''t quite get the puck off the ice.  
 ~respect = respect - 1
 ~skill = skill - 1
 - The goalie deflects the puck, but your teammate intercepts the rebound, shoots, and SCORES!
 GOAL!
 ~ENGL_goals = ENGL_goals + 1
 -> buzzer
 
==instigator==
Your opponent whirls around on you, shoving you in the chest. He starts yelling at you and getting in your face.
Don't engage with him! He fouled you, let the refs handle it.
+ [Defend yourself] -> fighter
+ [Back off] You hold your hands up, and skate away. The refs give your opponent a penalty for instigating and he goes to the penalty box. You skate back to the bench.
~respect = respect + 1
Good job not engaging. Now we have the power play.
You watch as your team rushes towards the net on the power play, up one player against your opponents. They pass back and forth to each other, and then your teammate gets a backhand shot off. He scores!
~ENGL_goals = ENGL_goals + 1
-> defense_shift
// diverts back into main weave
=fighter
~respect = respect - 5
Your fist connects with the side of his jaw, and then his hits you in the gut.
+ [Back off] You skate backwards, done with the fight.
+ Hit him again
    ++ [Knee him] Your knee connects with his chest.
    ~respect = respect - 1
    Good lord, rookie! If you're going to fight, at least fight fair! 
    ++ [Uppercut] He's bent low, but your hit stands him back up.
    Nice hit. At least we know you can hold your own in a fight.
    -- The refs step in and pull the two of you apart.
 - The refs skate you both off to the penalty box. 
 When your penalty minutes are up, you skate back over to the bench. 
-> benched

==benched==
Kid, you have to listen to me. I'm sorry, but I'm benching you for the rest of the game.
You stay on the bench the rest of the game, watching as your team plays without you.
-> buzzer

==buzzer==
// win conditions
{ENGL_goals > COMP_goals: The buzzer sounds, and your teammates slam into you to celebrate the win.}
// loss conditions
{ENGL_goals < COMP_goals: The buzzer sounds, and the Penguins slam into each other to celebrate their win.}
// tie conditions: cannot for the life of me figure out how to get this text to show up if the ENGL_goals and COMP_goals variables are equal.
{not ENGL_goals > COMP_goals && not ENGL_goals < COMP_goals: The buzzer sounds, and everyone skates off the ice. It's a tie, but because this is just a rec league, you're not going into overtime. The game is over.}
// good game
{respect > 4: Good job on your first game. You worked hard, and I appreciate your effort on the ice.} {skill > 3: You've earned a spot on this team, kid.}
// bad game
{respect < 4:  Pay more attention to what your coach tells you next time.}
-> END