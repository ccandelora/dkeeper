import List "mo:base/List";
import Text "mo:base/Text";
import Debug "mo:base/Debug";
import Nat16 "mo:base/Nat16";

actor DKeeper{

  public type Note = {
    title: Text;
    content: Text;
  };

  stable var notes: List.List<Note> = List.nil<Note>();

  public func createNote(titleText: Text, contentText: Text) {

    let NewNote: Note = {
      title = titleText ;
      content = contentText
    };

    notes := List.push(NewNote, notes);
    Debug.print(debug_show(notes));
  };

  public query func getNotes(): async [Note] {
    return List.toArray(notes);
  };

  public func deleteNoteById(id: Nat) {
    var frontNotes : List.List<Note> = List.take(notes, id);
    var backNotes : List.List<Note> = List.drop(notes, id + 1);
    notes := List.append(frontNotes, backNotes);
  };
};
