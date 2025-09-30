
;; Length
(= (length-expr $expr)
   (function
     (unify $expr ()
       (return 0)
       (chain (length-expr (cdr-atom $expr)) $n
         (return (+ 1 $n))))))



;;foldl
(= (foldl-expr $f $acc $expr)
   (function
     (unify $expr ()
       (return $acc)
       (chain (eval ($f $acc (car-atom $expr))) $inter
         (return (foldl-expr $f $inter (cdr-atom $expr))))
     )
   )
)

; head of expression
(= (head-expr $expr)
   (function
     (unify $expr ()
       (return ())
       (return (car-atom $expr))
     )
   )
)

; tail of expression
(= (tail-expr $expr)
   (function
     (unify $expr ()
       (return ())
       (return (cdr-atom $expr))
     )
   )
)


(= (contains $x $expr) (function (unify $expr () (return false) (unify $x (car-atom $expr) (return true) (return (contains $x (cdr-atom $expr)))))))

