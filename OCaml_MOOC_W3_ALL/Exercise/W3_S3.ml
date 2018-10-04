(*
TYPE DIRECTED PROGRAMMING  (40/40 points)
In this exercise, you will experiment with type-directed programming.

We give you the example program of the lecture in which two type definitions have been changed as in the given prelude. A case Tired has been added to type state, and a case Sleep has been added to type action.
By clicking the typecheck button, you can notice that several warnings are issued by the OCaml compiler. Go through the code and fix these warnings as follow.

Update apply_action so that the Sleep action turns a character from the Tired state to the Hungry state.
Update possible_changes_for_character so that the Tired state behaves as the Hungry state.
Update describe_state so that the description of the Tired state is "tired".
Update tell_action so that tell_action Sleep is "took a nap".

THE GIVEN PRELUDE

type story = {
  context         : context;
  perturbation    : event;
  adventure       : event list;
  conclusion      : context;
}
and context = { characters : character list }
and character = { name  : string; state : state; location : location }
and event = Change of character * state | Action of character * action
and state = Happy | Hungry | Tired
and action = Eat | GoToRestaurant | Sleep
and location = Appartment | Restaurant
*)

let compatible_actions_for_character character context =
  match character with
  | { location = Restaurant } -> [Eat]
  | { location = Appartment } -> [GoToRestaurant]
;;

let apply_action character = function
  | Eat ->
      { state = Happy;
        location = character.location; name = character.name }
  | GoToRestaurant ->
      { location = Restaurant;
        state = character.state; name = character.name }
  | Sleep ->
      { location = character.location;
        state = Hungry; name = character.name }
;;

let compatible_actions context =
  let rec aux = function
    | [] -> []
    | character :: cs ->
        let can_do = compatible_actions_for_character character context in
        let rec aux' = function
          | [] -> []
          | a :: actions -> Action (character, a) :: aux' actions
        in
        aux' can_do
  in
  aux context.characters
;;

let possible_changes_for_character character =
  match character with
  | { state = Happy } -> [Hungry]
  | { state = Hungry } -> []
  | { state = Tired } -> []
;;
let apply_change character state =
  { name = character.name; state = state; location = character.location }
;;

let possible_changes context =
  let rec aux = function
    | [] -> []
    | character :: cs ->
        let possible_changes = possible_changes_for_character character in
        let rec aux' = function
          | [] -> []
          | c :: changes -> Change (character, c) :: aux' changes
        in
        aux' possible_changes
  in
  aux context.characters
;;

let character_of_event = function
  | Action (character, _) -> character
  | Change (character, _) -> character
;;

let apply event context =
  let rec aux = function
    | [] -> assert false
    | character :: cs ->
        if character = character_of_event event then
          match event with
          | Action (_, action) -> apply_action character action :: cs
          | Change (_, change) -> apply_change character change :: cs
        else
          character :: aux cs
  in
  { characters = aux context.characters }
;;

let rec is_one_of state states =
  match states with
  | [] -> false
  | state' :: ss -> state = state' || is_one_of state ss
;;

let rec all_characters_are states = function
  | [] ->
      true
  | character :: cs ->
      is_one_of character.state states && all_characters_are states cs
;;

let random_pick xs =
  List.nth xs (Random.int (List.length xs))
;;

let something_happens context =
  let what_can_happen = compatible_actions context @ possible_changes context in
  let event = random_pick what_can_happen in
  event, apply event context
;;
let happy context =
  all_characters_are [Happy] context.characters
;;

let rec end_story events context =
  if happy context then
    context, List.rev events
  else
    let event, context = something_happens context in
    end_story (event :: events) context
;;

let make_story initial_context =
  let perturbation, context = something_happens initial_context in
  let conclusion, adventure = end_story [] context in
  {
    context = initial_context;
    perturbation = perturbation;
    adventure = adventure;
    conclusion = conclusion
  }
;;

let describe_location = function
  | Appartment -> "at home"
  | Restaurant -> "at the restaurant"
;;
let describe_state = function
  | Happy -> "happy"
  | Hungry -> "hungry"
  | Tired -> "tired"
;;
let describe character =
  character.name ^ " was "
  ^ describe_location character.location
  ^ " and was " ^ describe_state character.state ^ ". "
;;

let tell_context context =
  let rec aux = function
    | [] -> ""
    | character :: characters -> describe character ^ aux characters
  in
  aux context.characters
;;

let tell_action = function
  | Eat -> "ate"
  | GoToRestaurant -> "went to the restaurant"
  | Sleep -> "took a nap"
;;

let tell_event = function
  | Action (character, action) ->
      character.name ^ " " ^ tell_action action ^ ". "
  | Change (character, state) ->
      character.name ^ " was made " ^ describe_state state ^ ". "
;;

let rec tell_adventure = function
  | [] -> ""
  | event :: adventure -> tell_event event ^ tell_adventure adventure
;;

let tell story =
  "Once upon a time, "
  ^ tell_context story.context
  ^ "One day, something wrong happened. "
  ^ tell_event story.perturbation
  ^ tell_adventure story.adventure
  ^ "At the end, the peace was restored. "
  ^ tell_context story.conclusion
;;

let story = tell (make_story {
    characters = [
      { name = "Sophie"; location = Appartment; state = Happy };
      { name = "Socrate"; location = Appartment; state = Happy };
    ]
  });;
