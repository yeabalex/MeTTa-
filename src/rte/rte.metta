;delete incosistent
(= (incon-handle ()) ())
(= (incon-handle $expr)
    (let* (
        ($head (car-atom $expr))
        ($tail (cdr-atom $expr))
    )
        ((unify $head ($a (AND (NOT $x) $y)) ($a (incon-handle $tail)) ($head (incon-handle $tail))))
    ))


;or-cut
(= (or-cut ()) ())

(= (or-cut $expr)
   (let* (
       ($head (car-atom $expr))
       ($tail (cdr-atom $expr))
   )
       (unify $head (OR $x)
           $x
           (unify $head (OR $left $right)
               (OR (or-cut $left) (or-cut $right))
               ($head (or-cut $tail))))))




;zero-subsume
(= (zero-subsume ()) ())

(= (zero-subsume $expr)
   (let* (
       ($head (car-atom $expr))
       ($tail (cdr-atom $expr))
   )
       (unify $head (OR $l TRUE)
           (zero-subsume $tail)
           (unify $head (OR $left $mid $or)
               (OR (zero-subsume $left) (zero-subsume $mid))
               ($head (zero-subsume $tail))))))
