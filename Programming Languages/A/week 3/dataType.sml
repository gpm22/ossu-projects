datatype exp = Constant of int
            | Negate of exp
            | Add of exp * exp
            | Multiply of exp * exp


fun eval e =
    case e of
         Constant i => i
        | Negate e2 => ~ (eval e2)
        | Add(e1,e2) => (eval e1) + (eval e2)
        | Multiply(e1,e2) => (eval e1) * (eval e2)
        

fun largest_constant e =
    case e of
         Constant i => i
        | Negate e2 => largest_constant e2
        | Add(e1,e2) => let val c1 = largest_constant e1;
                            val c2 = largest_constant e2;
        				in if c1 > c2
        				then c1
        				else c2
        				end
        | Multiply(e1,e2) => let val c1 = largest_constant e1;
                                 val c2 = largest_constant e2;
        				in if c1 > c2
        				then c1
        				else c2
        				end

fun constants e =
    case e of
         Constant i => i::[]
        | Negate e2 => constants e2
        | Add(e1,e2) => constants e1 @ constants e2
						 
        | Multiply(e1,e2) => constants e1 @ constants e2

fun is_any_multiplication e =
    case e of
         Constant i => false
        | Negate e2 => false orelse is_any_multiplication e2
        | Add(e1,e2) => false orelse is_any_multiplication e1 orelse is_any_multiplication e2
        | Multiply(e1,e2) => true

fun number_of_adds e =
    case e of
         Constant i => 0
        | Negate e2 => number_of_adds e2
        | Add(e1,e2) => 1 + number_of_adds e1 + number_of_adds e2
        | Multiply(e1,e2) => number_of_adds e1 + number_of_adds e2
