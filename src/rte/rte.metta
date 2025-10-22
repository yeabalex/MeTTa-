;delete incosistent
(= (incon-handle ()) ())
(= (incon-handle $expr)
    (let* (
        ($head (car-atom $expr))
        ($tail (cdr-atom $expr))
    )
        ((unify $head ($a (AND (NOT $x) $y)) ($a (incon-handle $tail)) ($head (incon-handle $tail))))
    ))

!(incon-handle (AND A (OR (AND (NOT A) (OR (AND B) (AND C)))) (AND B)))


;(AND A (OR (AND B (OR (AND (NOT D)))) (AND (NOT C))))
;(AND A (OR (AND  B   (NOT  D)) (AND  (NOT  C))))


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

!(or-cut (AND A (OR (AND B (OR (AND (NOT D)))) (AND (NOT C)))))
