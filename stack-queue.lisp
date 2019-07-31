

(defparameter stack '())

(defun top (st)
  (car st))

(push 'a stack)
(push 'b stack)
(push 'c stack)
(top stack)
(pop stack)

(defparameter queue '())

(defun top (qu)
  (car qu))

(defun enqueue (element)
  (append queue (list element)))

(defun dequeue ()
  (setf queue (cdr queue)))

(setf queue '(1 2 3 4))
(enqueue '5)
(dequeue)
(top queue)

(defun fibonacci (number)
  (cond
    ((< number 1) 1)
    (t (+ (fibonacci (- number 1)) (fibonacci (- number 2))))))

(fibonacci 1)

(defun fibonacci (number)
  (let ((f '(1 1)))
    (dotimes )))
