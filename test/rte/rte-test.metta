! (import! &atoms ../src/rte/rte)


!(incon-handle (AND A (OR (AND (NOT A) (OR (AND B) (AND C)))) (AND B)))


!(or-cut (AND A (OR (AND B (OR (AND (NOT D)))) (AND (NOT C)))))


!(zero-subsume (AND A (OR (AND A)
    (AND (NOT B) (OR (AND E) (AND F)))
    (OR (AND C) TRUE))))

