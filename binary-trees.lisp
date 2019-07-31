

;;Simple
;;(1 (2) (3))
;;(1 (2 (4) (5)) (3 (6) (7)))

(cons 1 2)
(car (cons 1 2))
(cdr (cons 1 2))
(cons 1 (cons 2 nil))
(cons 1 (list (cons 2 nil)))
(car '(1 (2) (3)))
(car (car (cdr (cdr '(1 (2) (3))))))
;;CL book
(defun print-tree (tree &optional (stream *standard-output*))
  (if-bind root (tree-root tree)
	   (print-nodes root 0 stream)
	   (format stream "<empty>"))
  (values))
(print-tree '(1 (2 3)))

(defparameter one-child-tree '(1 (2) (3)))
(defun swap-tree-elements (tree)
  (let ((root (car tree))
        (left (car (car (cdr tree))))
        (right (car (car (cdr (cdr tree))))))
    (cons right (cons (list left) (list (cons root nil))))))

(swap-tree-elements '(1 (2) (3)))




