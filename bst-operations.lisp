
;;Basic opertions on binary search tree

(defun root (tree)
  (car tree))

(defun left-element (tree)
  (car (car (cdr tree))))

(defun right-element (tree)
  (car (car (cdr (cdr tree)))))

(defun left-tree (tree)
  (car (cdr tree)))

(defun right-tree (tree)
  (car (cdr (cdr tree))))

(defun is-bst? (tree)
  (let ((len-t (length tree))
        (lt (left-tree tree))
        (rt (right-tree tree))
        (le (left-element tree))
        (re (right-element tree))
        (ro (root tree)))
    (cond
      ((null tree) 1)
      ((eql len-t 1) 1)
      ((null le)
       (if (> ro re)
           0
           (is-bst? rt)))
      ((null re)
       (if (< ro le)
           0
           (is-bst? lt)))
      ((or (> ro re) (< ro le)) 0)
      (t (and (is-bst? lt)
              (is-bst? rt))))))

(is-bst? '(8 (3 (1) (6 (4) (7))) (10 () (14 (13) ()))))
(is-bst? '(8 (3) (10)))
(is-bst? '(8 (3 (1) ()) (10)))
(is-bst? '(8 (3 (1) (6)) (10)))
(is-bst? '(8 (3 (1) (6 (4) ())) (10)))
(is-bst? '(8 (3 (1) (6 (4) ())) (1)))


;;Insert into bst
(defun insert-bst (tree element)
  )
