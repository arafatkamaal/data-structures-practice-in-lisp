
;;Binary search tree
;; We define tree as (1 (2 (3) (4)) (5 (6) (7)))

(defun root (tree)
  (car tree))

(root '(1 (2 (3) (4)) (5 (6) (7))))

(defun left-element (tree)
  (car (car (cdr tree))))

(left-element '(1 (2 (3) (4)) (5 (6) (7))))
(left-element '(1 () (3)))
(null nil)

(defun right-element (tree)
  (car (car (cdr (cdr tree)))))

(right-element '(1 (2 (3) (4)) (5 (6) (7))))

(defun left-tree (tree)
  (car (cdr tree)))

(left-tree '(1 (2 (3) (4)) (5 (6) (7))))

(defun right-tree (tree)
  (car (cdr (cdr tree))))

(right-tree '(1 (2 (3) (4)) (5 (6) (7))))

(defun is-bst? (tree)
  (cond
    ((null tree) 1)
    ((eq (length tree) 1) 1)
    ((or (not (< (root tree) (left-element tree)))
         (not (> (root tree) (right-element tree)))) 0)
    (t (and (is-bst? (left-tree tree))
            (is-bst? (right-tree tree))))))

(defun is-bst? (tree)
  (cond
    ((null tree) 1)
    ((eq (length tree) 1) 1)
    (t (cond
         ((null left-element)
          (if (not (> (root tree) (right-element tree))) 0))
         ((null right-element)
          (if (not (< (root tree) (left-element tree))) 0))
         ((or (not (< (root tree) (left-element tree)))
              (not (> (root tree) (right-element tree)))) 0)
         (t (and (is-bst? (left-tree tree))
                 (is-bst? (right-tree tree))))))))


(defun is-bst? (tree)
  (cond
    ((null tree) 1)
    ((eq (length tree) 1) 1)
    (t (let ((le (left-element tree))
             (re (right-element tree))
             (lt (left-tree tree))
             (rt (right-tree tree))
             (ro (root tree)))
         (cond
           ((null le)
            (if (>= ro re)
                0
                (is-bst? rt)))
           ((null re)
            (if (<= ro le)
                0
                (is-bst? lt)))
           ((or (>= ro re) (<= ro le)) 0)
           (t (and (is-bst? lt)
                   (is-bst? rt))))))))



(is-bst? '(8 (3 (1) (6 (4) (7))) (10 () (14 (13) ()))))
(is-bst? '(8 (3) (10)))
(is-bst? '(8 (3 (1) ()) (10)))
(is-bst? '(8 (3 (1) (6)) (10)))
(is-bst? '(8 (3 (1) (6 (4) ())) (10)))
(is-bst? '(8 (3 (1) (6 (4) ())) (1)))

;;;Binary search tree
;; We define tree as (1 (2 (3) (4)) (5 (6) (7)))

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
  (cond
    ((null tree) 1)
    ((eq (length tree) 1) 1)
    (t (let ((le (left-element tree))
             (re (right-element tree))
             (lt (left-tree tree))
             (rt (right-tree tree))
             (ro (root tree)))
         (cond
           ((null le)
            (if (>= ro re)
                0
                (is-bst? rt)))
           ((null re)
            (if (<= ro le)
                0
                (is-bst? lt)))
           ((or (>= ro re) (<= ro le)) 0)
           (t (and (is-bst? lt)
                   (is-bst? rt))))))))



