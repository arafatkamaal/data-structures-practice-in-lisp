

;;Unival tree
;; We represent trees as (1 (2) (3)) ...

(defun root (tree)
  (car tree))

(defun left-element (tree)
  (car (car (cdr tree))))

(defun right-element (tree)
  (car (car (cdr (cdr tree)))))

(defun right-tree (tree)
  (car (cdr (cdr tree))))

(defun left-tree (tree)
  (car (cdr tree)))

(defparameter t3ee '(1 (2 (4) (5)) (3 (6) (7))))
(root t3ee)
(left-element t3ee)
(right-element t3ee)
(right-tree t3ee)
(left-tree t3ee)
(left-tree (left-tree t3ee))
(left-tree (left-tree (left-tree t3ee)))

(defun is-st-unival (tree)
  (cond
    ((null tree) 1)
    ((eq (length tree) 1) 1)
    ((or (not (eq (root tree) (left-element tree)))
         (not (eq (root tree) (right-element tree)))) 0)
    (t (or (is-st-unival (left-tree tree))
           (is-st-unival (right-tree tree))))))


(defun is-unival (tree)
  (cond
    ((null tree) 1)
    ((eq (length tree) 1) 1)
    ((or (not (eq (root tree) (left-element tree)))
         (not (eq (root tree) (right-element tree)))) 0)
    (t (and (is-unival (left-tree tree))
            (is-unival (right-tree tree))))))

(defun count-unival-trees (tree)
  (cond
    ((null tree) 0)
    ((eq (length tree) 1) 0)
    (t (+ (is-unival tree)
          (count-unival-trees (left-tree tree))
          (count-unival-trees (right-tree tree))))))


(is-unival '(1 (1) (0)))
(is-unival '(1 (1) (1)))
(is-unival '(1 (1 (1) (1)) (1 (1) (1))))
(is-unival '(1 (1 (1) (1)) (1 (1) (0))))

(count-unival-trees '(1 (1 (1) (1)) (1 (1) (0))))
(count-unival-trees '(1 (1 (1) (1)) (1 (1) (1))))
(count-unival-trees '(1 (1 (1) (1)) (1 (1 (1) (1)) (1))))

;;;Final set
;;Unival tree
;; We represent trees as (1 (2) (3)) ...

(defun root (tree)
  (car tree))

(defun left-element (tree)
  (car (car (cdr tree))))

(defun right-element (tree)
  (car (car (cdr (cdr tree)))))

(defun right-tree (tree)
  (car (cdr (cdr tree))))

(defun left-tree (tree)
  (car (cdr tree)))

(defun is-unival (tree)
  (cond
    ((null tree) 1)
    ((eq (length tree) 1) 1)
    ((or (not (eq (root tree) (left-element tree)))
         (not (eq (root tree) (right-element tree)))) 0)
    (t (and (is-unival (left-tree tree))
            (is-unival (right-tree tree))))))

(defun count-unival-trees (tree)
  (cond
    ((null tree) 0)
    ((eq (length tree) 1) 0)
    (t (+ (is-unival tree)
          (count-unival-trees (left-tree tree))
          (count-unival-trees (right-tree tree))))))
