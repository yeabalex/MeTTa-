!(pragma! interpreter bare-minimal)

;length
(= (length $list)
   (function
     (unify $list Nil
       (return 0)
       (unify $list (Cons $x $xs)
         (chain (length $xs) $n
           (return (+ 1 $n)))
         (return (Error $list unrecognizedFormat))))))


;foldl
(= (foldl $f $acc $list)
   (function
    (unify $list Nil (return $acc)
     (unify $list (Cons $x $xs) (chain (eval ($f $acc $x)) $inter
       (return (foldl $f $inter $xs)))
        (return (Error $list unrecognizedFormat))))))

;map
(= (map $f $list)
   (function
     (unify $list Nil
       (return Nil)
       (unify $list (Cons $x $xs)
         (chain (eval ($f $x)) $inter
           (return (Cons $inter (map $f $xs))))
         (return (Error $list unrecognizedFormat))))))


;head
(= (head $list)
    (function 
        (unify $list Nil 
            (return Nil)
                (unify $list (Cons $x $xs)
                    (return $x)
                        (return (Error $list unrecognizedFormat))))))

;tail
(= (tail $list)
    (function 
        (unify $list Nil 
            (return Nil)
                (unify $list (Cons $x $xs)
                    (return $xs)
                        (return (Error $list unrecognizedFormat))))))

;append
(= (append $e $list)
    (function
        (unify $list Nil
            (return (Cons $e Nil))
                (unify $list (Cons $x $xs)
                    (return (Cons $x (append $e $xs)))
                        (return (Error $list unrecognizedFormat))))))

;filter
(= (filter $f $list)
   (function
     (unify $list Nil
       (return Nil)
       (unify $list (Cons $x $xs)
         (chain (eval ($f $x)) $r
           (return (if $r (Cons $x (filter $f $xs)) (filter $f $xs))))
         (return (Error $list unrecognizedFormat))))))


;concat
(= (contains $x $list)
   (function
     (unify $list Nil
       (return false)
       (unify $list (Cons $y $ys)
         (unify $x $y
           (return True)
           (return (contains $x $ys)))
         (return (Error $list unrecognizedFormat))))))

;reverse
(= (reverse-acc $list $acc)
   (function
     (unify $list Nil
       (return $acc)
       (unify $list (Cons $x $xs)
         (return (reverse-acc $xs (Cons $x $acc)))
         (return (Error $list unrecognizedFormat))))))

; main reverse
(= (reverse $list)
   (function
     (return (reverse-acc $list Nil))))


