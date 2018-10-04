(*
A SMALL TYPED DATABASE  (35/35 points)
The code of the mini-database example is given in the prelude.

You may have noticed that there is an error in the implementation of our database. This error leads to not finding users that should be in the database (because they have been added at some point, and not deleted since) after certain sequences of queries.
Find the bug and give a sequence of operations proof_of_bug of type query array that exhibits it when executed one after the other on an initially empty database.
The failure must be triggered by the last query.
To fix this bug, write a new version of delete that enforces the following invariant on the database, which is expected by the other functions.
All the contacts of a database db (and no others) should be stored in the array db.contacts between indexes 0 and db.number_of_contacts - 1 (inclusive).
Write a new function update : database -> contact -> (bool * database * contact) that either changes the number of an existing person or inserts a new contact. It should return true and the updated database if any of these two options succeeded, or false with the untouched database. The returned contact is not important, it is here just so the function has the same signature as the others.
Write an updated engine function that does an update when given a query with code 3, and uses your updated delete function.
THE GIVEN PRELUDE

(* A phone number is a sequence of four integers. *)
type phone_number = int * int * int * int;;

(* A contact has a name and a phone number. *)
type contact = {
  name         : string;
  phone_number : phone_number
};;

(* Here is a dumb contact. *)
let nobody = { name = ""; phone_number = (0, 0, 0, 0) };;

(* A database is a collection of contacts. *)
type database = {
  number_of_contacts : int;
  contacts : contact array;
};;

(* [make n] is the database with no contact and at most [n] contacts
    stored inside. *)
let make max_number_of_contacts =
  {
    number_of_contacts = 0;
    contacts = Array.make max_number_of_contacts nobody
  };;

(* Queries are represented by a code and a contact.
   - If the code is 0 then the contact must be inserted.
   - If the code is 1 then the contact must be deleted.
   - If the code is 2 then we are looking for a contact
     with the same name in the database. *)
type query = {
  code    : int;
  contact : contact;
}

let search db contact =
  let rec aux idx =
    if idx >= db.number_of_contacts then
      (false, db, nobody)
    else if db.contacts.(idx).name = contact.name then
      (true, db, db.contacts.(idx))
    else
      aux (idx + 1)
  in
  aux 0;;

let insert db contact =
  if db.number_of_contacts >= Array.length db.contacts then
    (false, db, nobody)
  else
    let (status, db, _) = search db contact in
    if status then (false, db, contact) else
      let cells i =
	if i = db.number_of_contacts then contact else db.contacts.(i)
      in
      let db' = {
          number_of_contacts = db.number_of_contacts + 1;
          contacts = Array.init (Array.length db.contacts) cells
        }
      in
      (true, db', contact);;

let delete db contact =
  let (status, db, contact) = search db contact in
  if not status then (false, db, contact)
  else
    let cells i =
      if db.contacts.(i).name = contact.name then
        nobody
      else
        db.contacts.(i) in
    let db' = {
        number_of_contacts = db.number_of_contacts - 1;
        contacts = Array.init (Array.length db.contacts) cells
      }
    in
    (true, db', contact);;

(* Engine parses and interprets the query. *)
let engine db { code ; contact } =
  if code = 0 then insert db contact
  else if code = 1 then delete db contact
  else if code = 2 then search db contact
  else (false, db, nobody);;

*)

let proof_of_bug =
  [|{code=0; contact={name="A"; phone_number=(1,2,3,4)}}; 
    {code=0; contact={name="B"; phone_number=(1,2,3,4)}}; 
    {code=1; contact={name="A"; phone_number=(1,2,3,4)}}; 
    {code=2; contact={name="B"; phone_number=(1,2,3,4)}};|];;

let rec findpos db contact idx =
  if (idx >= db.number_of_contacts)
  then -1
  else if db.contacts.(idx).name = contact.name
  then idx
  else findpos db contact (1 + idx);;

let delete db contact = 
  let (status, db, contact) = search db contact in
  if not status then (false, db, contact)
  else
    let pos = findpos db contact 0 in
    let cells i =
      if (i = (Array.length db.contacts) - 1) then nobody
      else if i < pos then db.contacts.(i)
      else db.contacts.(i + 1)  in
    let db' = {
      number_of_contacts = db.number_of_contacts - 1;
      contacts = Array.init (Array.length db.contacts) cells
    }
    in
    (true, db', contact);;

let update db contact =
  let (status, db, _) = search db contact in
  if status then 
    let (_,newdb,_) = delete db contact in insert newdb contact
  else
    insert db contact;;

let engine db { code ; contact } = 
  if code = 0 then insert db contact 
  else if code = 1 then delete db contact 
  else if code = 2 then search db contact 
  else if code = 3 then update db contact 
  else (false, db, nobody);;
