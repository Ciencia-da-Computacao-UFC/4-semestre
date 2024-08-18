fun {CorrectAppend Ls Ms}
    case Ls
    of nil then Ms
    [] L|Lr then L|{Append Lr Ms}
    end
 end
 
 fun {Append Ls Ms}
    case Ms
    of nil then Ls
    [] X|Mr then {Append {Append Ls [X]} Mr}
    end
 end