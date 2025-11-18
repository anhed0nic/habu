;;;; Comprehensive Test Suite for All List Functions
;;;; Tests every list operation with multiple edge cases and scenarios
;;;; This is an extremely thorough test suite covering all list operations

(load "test-harness.lisp")
(load "repl.lisp")

(in-package :habu-compiler)

(reset-test-stats)

(format t "~%")
(format t "~A~%" (color-blue "========================================="))
(format t "~A~%" (color-blue "  Comprehensive List Functions Tests"))
(format t "~A~%" (color-blue "========================================="))

(test-group "Basic List Construction Functions"
  (test-case cons-creates-pair-with-two-fixnum-integers
    (let ((the-result-of-consing-one-and-two (habu-compiler::interpret-expr 
                                                (habu-compiler::parse '(cons 1 2)) 
                                                nil)))
      (assert (consp the-result-of-consing-one-and-two))
      (assert (= (car the-result-of-consing-one-and-two) 1))
      (assert (= (cdr the-result-of-consing-one-and-two) 2))))
  
  (test-case cons-creates-list-when-second-argument-is-nil
    (let ((the-result-of-consing-fortytwo-onto-nil (habu-compiler::interpret-expr 
                                                      (habu-compiler::parse '(cons 42 nil)) 
                                                      nil)))
      (assert (consp the-result-of-consing-fortytwo-onto-nil))
      (assert (= (car the-result-of-consing-fortytwo-onto-nil) 42))
      (assert (null (cdr the-result-of-consing-fortytwo-onto-nil)))))
  
  (test-case cons-creates-list-when-second-argument-is-another-list
    (let ((the-result-of-consing-one-onto-list-two-three (habu-compiler::interpret-expr 
                                                            (habu-compiler::parse '(cons 1 (cons 2 (cons 3 nil)))) 
                                                            nil)))
      (assert (consp the-result-of-consing-one-onto-list-two-three))
      (assert (= (car the-result-of-consing-one-onto-list-two-three) 1))
      (assert (= (car (cdr the-result-of-consing-one-onto-list-two-three)) 2))
      (assert (= (car (cdr (cdr the-result-of-consing-one-onto-list-two-three))) 3))))
  
  (test-case list-creates-empty-list-with-no-arguments
    (let ((the-result-of-calling-list-with-zero-arguments (habu-compiler::interpret-expr 
                                                             (habu-compiler::parse '(list)) 
                                                             nil)))
      (assert (null the-result-of-calling-list-with-zero-arguments))))
  
  (test-case list-creates-single-element-list
    (let ((the-result-of-calling-list-with-one-argument (habu-compiler::interpret-expr 
                                                           (habu-compiler::parse '(list 100)) 
                                                           nil)))
      (assert (consp the-result-of-calling-list-with-one-argument))
      (assert (= (car the-result-of-calling-list-with-one-argument) 100))
      (assert (null (cdr the-result-of-calling-list-with-one-argument)))))
  
  (test-case list-creates-list-with-multiple-elements
    (let ((the-result-of-calling-list-with-five-arguments (habu-compiler::interpret-expr 
                                                             (habu-compiler::parse '(list 10 20 30 40 50)) 
                                                             nil)))
      (assert (consp the-result-of-calling-list-with-five-arguments))
      (assert (= (car the-result-of-calling-list-with-five-arguments) 10))
      (assert (= (car (cdr the-result-of-calling-list-with-five-arguments)) 20))
      (assert (= (car (cdr (cdr the-result-of-calling-list-with-five-arguments))) 30))
      (assert (= (car (cdr (cdr (cdr the-result-of-calling-list-with-five-arguments)))) 40))
      (assert (= (car (cdr (cdr (cdr (cdr the-result-of-calling-list-with-five-arguments))))) 50))))
  
  (test-case list-creates-list-with-nested-list-expressions
    (let ((the-result-of-calling-list-with-nested-arithmetic (habu-compiler::interpret-expr 
                                                                (habu-compiler::parse '(list (+ 1 2) (* 3 4) (- 10 5))) 
                                                                nil)))
      (assert (consp the-result-of-calling-list-with-nested-arithmetic))
      (assert (= (car the-result-of-calling-list-with-nested-arithmetic) 3))
      (assert (= (car (cdr the-result-of-calling-list-with-nested-arithmetic)) 12))
      (assert (= (car (cdr (cdr the-result-of-calling-list-with-nested-arithmetic))) 5)))))

(test-group "List Accessor Functions"
  (test-case car-extracts-first-element-from-two-element-list
    (let ((the-result-of-taking-car-of-one-two (habu-compiler::interpret-expr 
                                                  (habu-compiler::parse '(car (cons 1 2))) 
                                                  nil)))
      (assert (= the-result-of-taking-car-of-one-two 1))))
  
  (test-case car-extracts-first-element-from-longer-list
    (let ((the-result-of-taking-car-of-list (habu-compiler::interpret-expr 
                                               (habu-compiler::parse '(car (list 100 200 300))) 
                                               nil)))
      (assert (= the-result-of-taking-car-of-list 100))))
  
  (test-case cdr-extracts-second-element-from-pair
    (let ((the-result-of-taking-cdr-of-pair (habu-compiler::interpret-expr 
                                               (habu-compiler::parse '(cdr (cons 1 2))) 
                                               nil)))
      (assert (= the-result-of-taking-cdr-of-pair 2))))
  
  (test-case cdr-extracts-rest-of-list
    (let ((the-result-of-taking-cdr-of-list (habu-compiler::interpret-expr 
                                               (habu-compiler::parse '(cdr (list 10 20 30))) 
                                               nil)))
      (assert (consp the-result-of-taking-cdr-of-list))
      (assert (= (car the-result-of-taking-cdr-of-list) 20))
      (assert (= (car (cdr the-result-of-taking-cdr-of-list)) 30))))
  
  (test-case cdr-of-single-element-list-returns-nil
    (let ((the-result-of-taking-cdr-of-singleton (habu-compiler::interpret-expr 
                                                    (habu-compiler::parse '(cdr (list 42))) 
                                                    nil)))
      (assert (null the-result-of-taking-cdr-of-singleton))))
  
  (test-case first-is-alias-for-car
    (let ((the-result-of-taking-first-of-list (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(first (list 111 222 333))) 
                                                 nil)))
      (assert (= the-result-of-taking-first-of-list 111))))
  
  (test-case second-extracts-second-element
    (let ((the-result-of-taking-second-of-list (habu-compiler::interpret-expr 
                                                  (habu-compiler::parse '(second (list 11 22 33))) 
                                                  nil)))
      (assert (= the-result-of-taking-second-of-list 22))))
  
  (test-case third-extracts-third-element
    (let ((the-result-of-taking-third-of-list (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(third (list 5 10 15 20))) 
                                                 nil)))
      (assert (= the-result-of-taking-third-of-list 15))))
  
  (test-case fourth-extracts-fourth-element
    (let ((the-result-of-taking-fourth-of-list (habu-compiler::interpret-expr 
                                                  (habu-compiler::parse '(fourth (list 100 200 300 400 500))) 
                                                  nil)))
      (assert (= the-result-of-taking-fourth-of-list 400))))
  
  (test-case rest-is-alias-for-cdr
    (let ((the-result-of-taking-rest-of-list (habu-compiler::interpret-expr 
                                                (habu-compiler::parse '(rest (list 1 2 3 4))) 
                                                nil)))
      (assert (consp the-result-of-taking-rest-of-list))
      (assert (= (car the-result-of-taking-rest-of-list) 2)))))

(test-group "Composite Car Cdr Accessor Functions"
  (test-case caar-accesses-car-of-car
    (let ((the-result-of-taking-caar (habu-compiler::interpret-expr 
                                       (habu-compiler::parse '(caar (list (list 1 2) (list 3 4)))) 
                                       nil)))
      (assert (= the-result-of-taking-caar 1))))
  
  (test-case cadr-accesses-car-of-cdr
    (let ((the-result-of-taking-cadr (habu-compiler::interpret-expr 
                                       (habu-compiler::parse '(cadr (list 10 20 30))) 
                                       nil)))
      (assert (= the-result-of-taking-cadr 20))))
  
  (test-case cdar-accesses-cdr-of-car
    (let ((the-result-of-taking-cdar (habu-compiler::interpret-expr 
                                       (habu-compiler::parse '(cdar (list (list 5 6 7) (list 8 9)))) 
                                       nil)))
      (assert (consp the-result-of-taking-cdar))
      (assert (= (car the-result-of-taking-cdar) 6))))
  
  (test-case cddr-accesses-cdr-of-cdr
    (let ((the-result-of-taking-cddr (habu-compiler::interpret-expr 
                                       (habu-compiler::parse '(cddr (list 100 200 300 400))) 
                                       nil)))
      (assert (consp the-result-of-taking-cddr))
      (assert (= (car the-result-of-taking-cddr) 300))))
  
  (test-case caddr-accesses-car-of-cdr-of-cdr
    (let ((the-result-of-taking-caddr (habu-compiler::interpret-expr 
                                        (habu-compiler::parse '(caddr (list 1 2 3 4 5))) 
                                        nil)))
      (assert (= the-result-of-taking-caddr 3))))
  
  (test-case cadddr-accesses-car-of-cdr-of-cdr-of-cdr
    (let ((the-result-of-taking-cadddr (habu-compiler::interpret-expr 
                                         (habu-compiler::parse '(cadddr (list 10 20 30 40 50))) 
                                         nil)))
      (assert (= the-result-of-taking-cadddr 40)))))

(test-group "List Predicate Functions"
  (test-case consp-returns-true-for-cons-cell
    (let ((the-result-of-checking-if-pair-is-cons (habu-compiler::interpret-expr 
                                                     (habu-compiler::parse '(consp (cons 1 2))) 
                                                     nil)))
      (assert (= the-result-of-checking-if-pair-is-cons 1))))
  
  (test-case consp-returns-true-for-list
    (let ((the-result-of-checking-if-list-is-cons (habu-compiler::interpret-expr 
                                                     (habu-compiler::parse '(consp (list 1 2 3))) 
                                                     nil)))
      (assert (= the-result-of-checking-if-list-is-cons 1))))
  
  (test-case consp-returns-false-for-fixnum
    (let ((the-result-of-checking-if-number-is-cons (habu-compiler::interpret-expr 
                                                       (habu-compiler::parse '(consp 42)) 
                                                       nil)))
      (assert (= the-result-of-checking-if-number-is-cons 0))))
  
  (test-case consp-returns-false-for-nil
    (let ((the-result-of-checking-if-nil-is-cons (habu-compiler::interpret-expr 
                                                    (habu-compiler::parse '(consp nil)) 
                                                    nil)))
      (assert (= the-result-of-checking-if-nil-is-cons 0))))
  
  (test-case atom-returns-true-for-fixnum
    (let ((the-result-of-checking-if-number-is-atom (habu-compiler::interpret-expr 
                                                       (habu-compiler::parse '(atom 100)) 
                                                       nil)))
      (assert (= the-result-of-checking-if-number-is-atom 1))))
  
  (test-case atom-returns-true-for-nil
    (let ((the-result-of-checking-if-nil-is-atom (habu-compiler::interpret-expr 
                                                    (habu-compiler::parse '(atom nil)) 
                                                    nil)))
      (assert (= the-result-of-checking-if-nil-is-atom 1))))
  
  (test-case atom-returns-false-for-cons
    (let ((the-result-of-checking-if-list-is-atom (habu-compiler::interpret-expr 
                                                     (habu-compiler::parse '(atom (list 1 2))) 
                                                     nil)))
      (assert (= the-result-of-checking-if-list-is-atom 0))))
  
  (test-case null-returns-true-for-nil
    (let ((the-result-of-checking-if-nil-is-null (habu-compiler::interpret-expr 
                                                    (habu-compiler::parse '(null nil)) 
                                                    nil)))
      (assert (= the-result-of-checking-if-nil-is-null 1))))
  
  (test-case null-returns-true-for-zero
    (let ((the-result-of-checking-if-zero-is-null (habu-compiler::interpret-expr 
                                                     (habu-compiler::parse '(null 0)) 
                                                     nil)))
      (assert (= the-result-of-checking-if-zero-is-null 1))))
  
  (test-case null-returns-false-for-nonzero
    (let ((the-result-of-checking-if-fortytwo-is-null (habu-compiler::interpret-expr 
                                                         (habu-compiler::parse '(null 42)) 
                                                         nil)))
      (assert (= the-result-of-checking-if-fortytwo-is-null 0))))
  
  (test-case null-returns-false-for-list
    (let ((the-result-of-checking-if-list-is-null (habu-compiler::interpret-expr 
                                                     (habu-compiler::parse '(null (list 1))) 
                                                     nil)))
      (assert (= the-result-of-checking-if-list-is-null 0))))
  
  (test-case listp-returns-true-for-list
    (let ((the-result-of-checking-if-list-is-listp (habu-compiler::interpret-expr 
                                                      (habu-compiler::parse '(listp (list 1 2 3))) 
                                                      nil)))
      (assert (= the-result-of-checking-if-list-is-listp 1))))
  
  (test-case listp-returns-true-for-nil
    (let ((the-result-of-checking-if-nil-is-listp (habu-compiler::interpret-expr 
                                                     (habu-compiler::parse '(listp nil)) 
                                                     nil)))
      (assert (= the-result-of-checking-if-nil-is-listp 1))))
  
  (test-case listp-returns-false-for-number
    (let ((the-result-of-checking-if-number-is-listp (habu-compiler::interpret-expr 
                                                        (habu-compiler::parse '(listp 999)) 
                                                        nil)))
      (assert (= the-result-of-checking-if-number-is-listp 0)))))

(test-group "List Manipulation Functions"
  (test-case append-combines-two-empty-lists
    (let ((the-result-of-appending-two-empty-lists (habu-compiler::interpret-expr 
                                                      (habu-compiler::parse '(append (list) (list))) 
                                                      nil)))
      (assert (null the-result-of-appending-two-empty-lists))))
  
  (test-case append-combines-empty-list-with-nonempty-list
    (let ((the-result-of-appending-empty-to-nonempty (habu-compiler::interpret-expr 
                                                        (habu-compiler::parse '(append (list) (list 1 2 3))) 
                                                        nil)))
      (assert (consp the-result-of-appending-empty-to-nonempty))
      (assert (= (car the-result-of-appending-empty-to-nonempty) 1))
      (assert (= (car (cdr the-result-of-appending-empty-to-nonempty)) 2))
      (assert (= (car (cdr (cdr the-result-of-appending-empty-to-nonempty))) 3))))
  
  (test-case append-combines-nonempty-list-with-empty-list
    (let ((the-result-of-appending-nonempty-to-empty (habu-compiler::interpret-expr 
                                                        (habu-compiler::parse '(append (list 10 20) (list))) 
                                                        nil)))
      (assert (consp the-result-of-appending-nonempty-to-empty))
      (assert (= (car the-result-of-appending-nonempty-to-empty) 10))
      (assert (= (car (cdr the-result-of-appending-nonempty-to-empty)) 20))))
  
  (test-case append-combines-two-nonempty-lists
    (let ((the-result-of-appending-two-lists (habu-compiler::interpret-expr 
                                                (habu-compiler::parse '(append (list 1 2) (list 3 4 5))) 
                                                nil)))
      (assert (consp the-result-of-appending-two-lists))
      (assert (= (car the-result-of-appending-two-lists) 1))
      (assert (= (car (cdr the-result-of-appending-two-lists)) 2))
      (assert (= (car (cdr (cdr the-result-of-appending-two-lists))) 3))
      (assert (= (car (cdr (cdr (cdr the-result-of-appending-two-lists)))) 4))
      (assert (= (car (cdr (cdr (cdr (cdr the-result-of-appending-two-lists))))) 5))))
  
  (test-case reverse-reverses-empty-list
    (let ((the-result-of-reversing-empty-list (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(reverse (list))) 
                                                 nil)))
      (assert (null the-result-of-reversing-empty-list))))
  
  (test-case reverse-reverses-single-element-list
    (let ((the-result-of-reversing-singleton (habu-compiler::interpret-expr 
                                                (habu-compiler::parse '(reverse (list 42))) 
                                                nil)))
      (assert (consp the-result-of-reversing-singleton))
      (assert (= (car the-result-of-reversing-singleton) 42))))
  
  (test-case reverse-reverses-multiple-element-list
    (let ((the-result-of-reversing-list (habu-compiler::interpret-expr 
                                           (habu-compiler::parse '(reverse (list 1 2 3 4 5))) 
                                           nil)))
      (assert (consp the-result-of-reversing-list))
      (assert (= (car the-result-of-reversing-list) 5))
      (assert (= (car (cdr the-result-of-reversing-list)) 4))
      (assert (= (car (cdr (cdr the-result-of-reversing-list))) 3))
      (assert (= (car (cdr (cdr (cdr the-result-of-reversing-list)))) 2))
      (assert (= (car (cdr (cdr (cdr (cdr the-result-of-reversing-list))))) 1)))))

(test-group "List Length and Indexing Functions"
  (test-case length-of-empty-list-is-zero
    (let ((the-result-of-computing-length-of-empty-list (habu-compiler::interpret-expr 
                                                           (habu-compiler::parse '(length (list))) 
                                                           nil)))
      (assert (= the-result-of-computing-length-of-empty-list 0))))
  
  (test-case length-of-single-element-list-is-one
    (let ((the-result-of-computing-length-of-singleton (habu-compiler::interpret-expr 
                                                          (habu-compiler::parse '(length (list 100))) 
                                                          nil)))
      (assert (= the-result-of-computing-length-of-singleton 1))))
  
  (test-case length-of-five-element-list-is-five
    (let ((the-result-of-computing-length-of-five-elements (habu-compiler::interpret-expr 
                                                              (habu-compiler::parse '(length (list 10 20 30 40 50))) 
                                                              nil)))
      (assert (= the-result-of-computing-length-of-five-elements 5))))
  
  (test-case nth-extracts-zeroth-element
    (let ((the-result-of-extracting-zeroth-element (habu-compiler::interpret-expr 
                                                      (habu-compiler::parse '(nth 0 (list 100 200 300))) 
                                                      nil)))
      (assert (= the-result-of-extracting-zeroth-element 100))))
  
  (test-case nth-extracts-first-element
    (let ((the-result-of-extracting-first-element (habu-compiler::interpret-expr 
                                                     (habu-compiler::parse '(nth 1 (list 10 20 30))) 
                                                     nil)))
      (assert (= the-result-of-extracting-first-element 20))))
  
  (test-case nth-extracts-second-element
    (let ((the-result-of-extracting-second-element (habu-compiler::interpret-expr 
                                                      (habu-compiler::parse '(nth 2 (list 5 10 15 20))) 
                                                      nil)))
      (assert (= the-result-of-extracting-second-element 15))))
  
  (test-case nth-extracts-last-element
    (let ((the-result-of-extracting-last-element (habu-compiler::interpret-expr 
                                                    (habu-compiler::parse '(nth 4 (list 1 2 3 4 5))) 
                                                    nil)))
      (assert (= the-result-of-extracting-last-element 5))))
  
  (test-case nthcdr-with-zero-returns-whole-list
    (let ((the-result-of-nthcdr-zero (habu-compiler::interpret-expr 
                                       (habu-compiler::parse '(nthcdr 0 (list 10 20 30))) 
                                       nil)))
      (assert (consp the-result-of-nthcdr-zero))
      (assert (= (car the-result-of-nthcdr-zero) 10))))
  
  (test-case nthcdr-with-one-skips-first-element
    (let ((the-result-of-nthcdr-one (habu-compiler::interpret-expr 
                                      (habu-compiler::parse '(nthcdr 1 (list 100 200 300))) 
                                      nil)))
      (assert (consp the-result-of-nthcdr-one))
      (assert (= (car the-result-of-nthcdr-one) 200))))
  
  (test-case nthcdr-with-two-skips-two-elements
    (let ((the-result-of-nthcdr-two (habu-compiler::interpret-expr 
                                      (habu-compiler::parse '(nthcdr 2 (list 1 2 3 4 5))) 
                                      nil)))
      (assert (consp the-result-of-nthcdr-two))
      (assert (= (car the-result-of-nthcdr-two) 3)))))

(test-group "List Search and Membership Functions"
  (test-case member-finds-element-in-single-element-list
    (let ((the-result-of-searching-for-fortytwo-in-singleton (habu-compiler::interpret-expr 
                                                                (habu-compiler::parse '(member 42 (list 42))) 
                                                                nil)))
      (assert (consp the-result-of-searching-for-fortytwo-in-singleton))
      (assert (= (car the-result-of-searching-for-fortytwo-in-singleton) 42))))
  
  (test-case member-finds-element-at-beginning
    (let ((the-result-of-searching-for-first-element (habu-compiler::interpret-expr 
                                                        (habu-compiler::parse '(member 10 (list 10 20 30))) 
                                                        nil)))
      (assert (consp the-result-of-searching-for-first-element))
      (assert (= (car the-result-of-searching-for-first-element) 10))))
  
  (test-case member-finds-element-in-middle
    (let ((the-result-of-searching-for-middle-element (habu-compiler::interpret-expr 
                                                         (habu-compiler::parse '(member 20 (list 10 20 30))) 
                                                         nil)))
      (assert (consp the-result-of-searching-for-middle-element))
      (assert (= (car the-result-of-searching-for-middle-element) 20))))
  
  (test-case member-finds-element-at-end
    (let ((the-result-of-searching-for-last-element (habu-compiler::interpret-expr 
                                                       (habu-compiler::parse '(member 30 (list 10 20 30))) 
                                                       nil)))
      (assert (consp the-result-of-searching-for-last-element))
      (assert (= (car the-result-of-searching-for-last-element) 30))))
  
  (test-case member-returns-nil-when-element-not-found
    (let ((the-result-of-searching-for-missing-element (habu-compiler::interpret-expr 
                                                          (habu-compiler::parse '(member 99 (list 10 20 30))) 
                                                          nil)))
      (assert (null the-result-of-searching-for-missing-element))))
  
  (test-case member-returns-tail-starting-from-found-element
    (let ((the-result-of-member-returning-tail (habu-compiler::interpret-expr 
                                                  (habu-compiler::parse '(member 3 (list 1 2 3 4 5))) 
                                                  nil)))
      (assert (consp the-result-of-member-returning-tail))
      (assert (= (car the-result-of-member-returning-tail) 3))
      (assert (= (car (cdr the-result-of-member-returning-tail)) 4))
      (assert (= (car (cdr (cdr the-result-of-member-returning-tail))) 5)))))

(test-group "Association List Functions"
  (test-case assoc-finds-key-in-single-pair-alist
    (let ((the-result-of-searching-alist-for-key-a (habu-compiler::interpret-expr 
                                                      (habu-compiler::parse '(assoc 1 (list (cons 1 100)))) 
                                                      nil)))
      (assert (consp the-result-of-searching-alist-for-key-a))
      (assert (= (car the-result-of-searching-alist-for-key-a) 1))
      (assert (= (cdr the-result-of-searching-alist-for-key-a) 100))))
  
  (test-case assoc-finds-first-matching-key
    (let ((the-result-of-searching-alist-for-first-key (habu-compiler::interpret-expr 
                                                          (habu-compiler::parse '(assoc 1 (list (cons 1 10) (cons 2 20) (cons 3 30)))) 
                                                          nil)))
      (assert (consp the-result-of-searching-alist-for-first-key))
      (assert (= (car the-result-of-searching-alist-for-first-key) 1))
      (assert (= (cdr the-result-of-searching-alist-for-first-key) 10))))
  
  (test-case assoc-finds-middle-key
    (let ((the-result-of-searching-alist-for-middle-key (habu-compiler::interpret-expr 
                                                           (habu-compiler::parse '(assoc 2 (list (cons 1 10) (cons 2 20) (cons 3 30)))) 
                                                           nil)))
      (assert (consp the-result-of-searching-alist-for-middle-key))
      (assert (= (car the-result-of-searching-alist-for-middle-key) 2))
      (assert (= (cdr the-result-of-searching-alist-for-middle-key) 20))))
  
  (test-case assoc-finds-last-key
    (let ((the-result-of-searching-alist-for-last-key (habu-compiler::interpret-expr 
                                                         (habu-compiler::parse '(assoc 3 (list (cons 1 10) (cons 2 20) (cons 3 30)))) 
                                                         nil)))
      (assert (consp the-result-of-searching-alist-for-last-key))
      (assert (= (car the-result-of-searching-alist-for-last-key) 3))
      (assert (= (cdr the-result-of-searching-alist-for-last-key) 30))))
  
  (test-case assoc-returns-nil-when-key-not-found
    (let ((the-result-of-searching-alist-for-missing-key (habu-compiler::interpret-expr 
                                                            (habu-compiler::parse '(assoc 99 (list (cons 1 10) (cons 2 20)))) 
                                                            nil)))
      (assert (null the-result-of-searching-alist-for-missing-key))))
  
  (test-case assoc-handles-empty-alist
    (let ((the-result-of-searching-empty-alist (habu-compiler::interpret-expr 
                                                  (habu-compiler::parse '(assoc 1 (list))) 
                                                  nil)))
      (assert (null the-result-of-searching-empty-alist)))))

(test-group "Additional List Utility Functions"
  (test-case last-returns-last-cons-of-single-element-list
    (let ((the-result-of-getting-last-of-singleton (habu-compiler::interpret-expr 
                                                      (habu-compiler::parse '(last (list 42))) 
                                                      nil)))
      (assert (consp the-result-of-getting-last-of-singleton))
      (assert (= (car the-result-of-getting-last-of-singleton) 42))))
  
  (test-case last-returns-last-cons-of-multiple-element-list
    (let ((the-result-of-getting-last-of-list (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(last (list 10 20 30 40))) 
                                                 nil)))
      (assert (consp the-result-of-getting-last-of-list))
      (assert (= (car the-result-of-getting-last-of-list) 40))))
  
  (test-case butlast-removes-last-element-from-two-element-list
    (let ((the-result-of-butlast-on-two-elements (habu-compiler::interpret-expr 
                                                    (habu-compiler::parse '(butlast (list 1 2))) 
                                                    nil)))
      (assert (consp the-result-of-butlast-on-two-elements))
      (assert (= (car the-result-of-butlast-on-two-elements) 1))
      (assert (null (cdr the-result-of-butlast-on-two-elements)))))
  
  (test-case butlast-removes-last-element-from-longer-list
    (let ((the-result-of-butlast-on-many-elements (habu-compiler::interpret-expr 
                                                     (habu-compiler::parse '(butlast (list 100 200 300 400 500))) 
                                                     nil)))
      (assert (consp the-result-of-butlast-on-many-elements))
      (assert (= (car the-result-of-butlast-on-many-elements) 100))
      (assert (= (car (cdr the-result-of-butlast-on-many-elements)) 200))
      (assert (= (car (cdr (cdr the-result-of-butlast-on-many-elements))) 300))
      (assert (= (car (cdr (cdr (cdr the-result-of-butlast-on-many-elements)))) 400))
      (assert (null (cdr (cdr (cdr (cdr the-result-of-butlast-on-many-elements))))))))
  
  (test-case butlast-of-single-element-returns-nil
    (let ((the-result-of-butlast-on-singleton (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(butlast (list 99))) 
                                                 nil)))
      (assert (null the-result-of-butlast-on-singleton)))))

(report-test-stats)

(format t "~%All list functions tested comprehensively!~%")
(format t "Ready for integration into compiled code.~%")
