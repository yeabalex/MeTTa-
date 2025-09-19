
;Count number of atoms
(= (count-atoms ())
    0)
(= (count-atoms $a)
    (+ 1 (count-atoms (cdr-atom $a))))


;map
(: map-expr (-> (-> $t $t) Expression Expression))
(= (map-expr $f $expr)
   (if (== $expr ()) 
       () 
       (let* (
           ($head (car-atom $expr))               
           ($tail (cdr-atom $expr))               
           ($mapped-head ($f $head))          
           ($mapped-tail (map-expr $f $tail))    
       )
         (cons-atom $mapped-head $mapped-tail)
       )
   )
)


;filter
(= (filter $f ()) ()) 

(= (filter $f $expr)
   (let* (
       ($head (car-atom $expr))
       ($tail (cdr-atom $expr))
       ($filtered-head ($f $head))
       ($filtered-tail (filter $f $tail))
   )
       (if (== $filtered-head ())      
           $filtered-tail              
           (cons-atom $filtered-head $filtered-tail)  
       )
   )
)


;replce subexpression
;(= (replace-subexpr $expr $old $new)
;   (if (== $expr $old) 
;       $new                                
;       (if (== $expr ()) 
;           ()                               
;           (let* (
;               ($head (car-atom $expr))     
;               ($tail (cdr-atom $expr))    
;               ($new-head (replace-subexpr $head $old $new))
;               ($new-tail (replace-subexpr $tail $old $new))
;           )
;               (cons-atom $new-head $new-tail)
;           )
;       )
;   )
;)


;check if it contains a given atom

(= (contains $a ()) ())
(= (contains $a $expr)
    (let* (
        ($head (car-atom $expr))
        ($tail (cdr-atom $expr))
    )
        (if(== $head $a)
            True
            (contains $a $tail))
    ))


;reverse
(= (reverse-helper $acc ()) $acc)
(= (reverse-helper $acc $expr)
    (let* (
        ($head (car-atom $expr))
        ($tail (cdr-atom $expr))
    )
        (reverse-helper (cons-atom $head $acc) $tail)
    ))

(= (reverse $expr) (reverse-helper () $expr))



;concat

(= (concat $acc () $expr2) ((let* (
        ($head (car-atom $expr2))
        ($tail (cdr-atom $expr2))
    )
        (concat (cons-atom $head $acc) () $tail)
)))
(= (concat $acc $expr $expr2)
    (let* (
        ($head (car-atom $expr))
        ($tail (cdr-atom $expr))
    )
        (concat (cons-atom $head $acc) $tail $expr2)
    ))

(= (concat $acc () ()) $acc)

