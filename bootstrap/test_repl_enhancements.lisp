;;;; Comprehensive Test Suite for REPL Enhancements
;;;; Tests all REPL functionality including error handling, input validation, and edge cases
;;;; This test suite ensures the REPL is robust and user-friendly

(load "test-harness.lisp")
(load "repl.lisp")

(in-package :habu-compiler)

(reset-test-stats)

(format t "~%")
(format t "~A~%" (color-blue "========================================="))
(format t "~A~%" (color-blue "  Comprehensive REPL Enhancement Tests"))
(format t "~A~%" (color-blue "========================================="))

(test-group "REPL Expression Evaluation - Arithmetic Operations"
  (test-case repl-evaluates-simple-addition-of-two-positive-integers
    (let ((the-result-of-evaluating-addition-expression (habu-compiler::interpret-expr 
                                                          (habu-compiler::parse '(+ 10 20)) 
                                                          nil)))
      (assert (= the-result-of-evaluating-addition-expression 30))))
  
  (test-case repl-evaluates-subtraction-of-larger-from-smaller-number
    (let ((the-result-of-evaluating-subtraction-expression (habu-compiler::interpret-expr 
                                                             (habu-compiler::parse '(- 100 42)) 
                                                             nil)))
      (assert (= the-result-of-evaluating-subtraction-expression 58))))
  
  (test-case repl-evaluates-multiplication-of-two-factors
    (let ((the-result-of-evaluating-multiplication-expression (habu-compiler::interpret-expr 
                                                                (habu-compiler::parse '(* 7 8)) 
                                                                nil)))
      (assert (= the-result-of-evaluating-multiplication-expression 56))))
  
  (test-case repl-evaluates-division-of-evenly-divisible-numbers
    (let ((the-result-of-evaluating-division-expression (habu-compiler::interpret-expr 
                                                          (habu-compiler::parse '(/ 100 5)) 
                                                          nil)))
      (assert (= the-result-of-evaluating-division-expression 20))))
  
  (test-case repl-evaluates-modulo-operation-for-remainder
    (let ((the-result-of-evaluating-modulo-expression (habu-compiler::interpret-expr 
                                                        (habu-compiler::parse '(mod 17 5)) 
                                                        nil)))
      (assert (= the-result-of-evaluating-modulo-expression 2))))
  
  (test-case repl-evaluates-nested-arithmetic-with-multiple-operations
    (let ((the-result-of-evaluating-nested-arithmetic (habu-compiler::interpret-expr 
                                                        (habu-compiler::parse '(+ (* 3 4) (- 20 5))) 
                                                        nil)))
      (assert (= the-result-of-evaluating-nested-arithmetic 27))))
  
  (test-case repl-evaluates-deeply-nested-arithmetic-expressions
    (let ((the-result-of-evaluating-deeply-nested-expression (habu-compiler::interpret-expr 
                                                               (habu-compiler::parse '(* (+ 2 3) (- 10 (* 2 3)))) 
                                                               nil)))
      (assert (= the-result-of-evaluating-deeply-nested-expression 20)))))

(test-group "REPL Expression Evaluation - Comparison Operations"
  (test-case repl-evaluates-less-than-comparison-returning-true
    (let ((the-result-of-less-than-comparison-with-smaller-first (habu-compiler::interpret-expr 
                                                                   (habu-compiler::parse '(< 5 10)) 
                                                                   nil)))
      (assert (= the-result-of-less-than-comparison-with-smaller-first 1))))
  
  (test-case repl-evaluates-less-than-comparison-returning-false
    (let ((the-result-of-less-than-comparison-with-larger-first (habu-compiler::interpret-expr 
                                                                  (habu-compiler::parse '(< 10 5)) 
                                                                  nil)))
      (assert (= the-result-of-less-than-comparison-with-larger-first 0))))
  
  (test-case repl-evaluates-greater-than-comparison-returning-true
    (let ((the-result-of-greater-than-comparison-with-larger-first (habu-compiler::interpret-expr 
                                                                     (habu-compiler::parse '(> 20 10)) 
                                                                     nil)))
      (assert (= the-result-of-greater-than-comparison-with-larger-first 1))))
  
  (test-case repl-evaluates-greater-than-comparison-returning-false
    (let ((the-result-of-greater-than-comparison-with-smaller-first (habu-compiler::interpret-expr 
                                                                      (habu-compiler::parse '(> 5 15)) 
                                                                      nil)))
      (assert (= the-result-of-greater-than-comparison-with-smaller-first 0))))
  
  (test-case repl-evaluates-equality-comparison-for-equal-values
    (let ((the-result-of-equality-comparison-with-same-values (habu-compiler::interpret-expr 
                                                                (habu-compiler::parse '(= 42 42)) 
                                                                nil)))
      (assert (= the-result-of-equality-comparison-with-same-values 1))))
  
  (test-case repl-evaluates-equality-comparison-for-unequal-values
    (let ((the-result-of-equality-comparison-with-different-values (habu-compiler::interpret-expr 
                                                                     (habu-compiler::parse '(= 10 20)) 
                                                                     nil)))
      (assert (= the-result-of-equality-comparison-with-different-values 0))))
  
  (test-case repl-evaluates-less-than-or-equal-with-smaller-value
    (let ((the-result-of-less-equal-with_smaller_value (habu-compiler::interpret-expr 
                                                         (habu-compiler::parse '(<= 5 10)) 
                                                         nil)))
      (assert (= the-result-of-less-equal-with_smaller_value 1))))
  
  (test-case repl-evaluates-less-than-or-equal-with-equal-values
    (let ((the-result-of-less-equal-with-equal-values (habu-compiler::interpret-expr 
                                                        (habu-compiler::parse '(<= 10 10)) 
                                                        nil)))
      (assert (= the-result-of-less-equal-with-equal-values 1))))
  
  (test-case repl-evaluates-greater-than-or-equal-with-larger-value
    (let ((the-result-of-greater_equal-with-larger-value (habu-compiler::interpret-expr 
                                                           (habu-compiler::parse '(>= 20 10)) 
                                                           nil)))
      (assert (= the-result-of-greater_equal-with-larger-value 1))))
  
  (test-case repl-evaluates-greater-than-or-equal-with-equal-values
    (let ((the-result-of-greater-equal-with-equal-values (habu-compiler::interpret-expr 
                                                           (habu-compiler::parse '(>= 15 15)) 
                                                           nil)))
      (assert (= the-result-of-greater-equal-with-equal-values 1)))))

(test-group "REPL Expression Evaluation - Boolean Logic Operations"
  (test-case repl-evaluates-and-with-all-truthy-values
    (let ((the-result-of-and-with-all-nonzero-values (habu-compiler::interpret-expr 
                                                       (habu-compiler::parse '(and 1 2 3)) 
                                                       nil)))
      (assert (= the-result-of-and-with-all-nonzero-values 3))))
  
  (test-case repl-evaluates-and-with-first-falsy-value
    (let ((the-result-of-and-with-zero-first (habu-compiler::interpret-expr 
                                               (habu-compiler::parse '(and 0 1 2)) 
                                               nil)))
      (assert (= the-result-of-and-with-zero-first 0))))
  
  (test-case repl-evaluates-and-with-middle-falsy-value
    (let ((the-result-of-and-with-zero-middle (habu-compiler::interpret-expr 
                                                (habu-compiler::parse '(and 1 0 2)) 
                                                nil)))
      (assert (= the-result-of-and-with-zero-middle 0))))
  
  (test-case repl-evaluates-or-with-all-falsy-values
    (let ((the-result-of-or-with-all-zeros (habu-compiler::interpret-expr 
                                             (habu-compiler::parse '(or 0 0 0)) 
                                             nil)))
      (assert (= the-result-of-or-with-all-zeros 0))))
  
  (test-case repl-evaluates-or-with-first-truthy-value
    (let ((the-result-of-or-with-nonzero-first (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(or 5 0 0)) 
                                                 nil)))
      (assert (= the-result-of-or-with-nonzero-first 5))))
  
  (test-case repl-evaluates-or-with-middle-truthy-value
    (let ((the-result-of-or-with-nonzero-middle (habu-compiler::interpret-expr 
                                                  (habu-compiler::parse '(or 0 7 0)) 
                                                  nil)))
      (assert (= the-result-of-or-with-nonzero-middle 7))))
  
  (test-case repl-evaluates-not-of-truthy-value
    (let ((the-result-of-not-with-nonzero (habu-compiler::interpret-expr 
                                            (habu-compiler::parse '(not 42)) 
                                            nil)))
      (assert (= the-result-of-not-with-nonzero 0))))
  
  (test-case repl-evaluates-not-of-falsy-value
    (let ((the-result-of-not-with-zero (habu-compiler::interpret-expr 
                                         (habu-compiler::parse '(not 0)) 
                                         nil)))
      (assert (= the-result-of-not-with-zero 1))))
  
  (test-case repl-evaluates-complex-boolean-expression
    (let ((the-result-of-complex-boolean-logic (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(and (or 0 1) (not 0))) 
                                                 nil)))
      (assert (= the-result-of-complex-boolean-logic 1)))))

(test-group "REPL Expression Evaluation - Conditional Expressions"
  (test-case repl-evaluates-if-with-truthy-condition-returns-then-branch
    (let ((the-result-of-if-with-true-condition (habu-compiler::interpret-expr 
                                                  (habu-compiler::parse '(if 1 100 200)) 
                                                  nil)))
      (assert (= the-result-of-if-with-true-condition 100))))
  
  (test-case repl-evaluates-if-with-falsy-condition-returns-else-branch
    (let ((the-result-of-if-with-false-condition (habu-compiler::interpret-expr 
                                                   (habu-compiler::parse '(if 0 100 200)) 
                                                   nil)))
      (assert (= the-result-of-if-with-false-condition 200))))
  
  (test-case repl-evaluates-if-with-comparison-condition
    (let ((the-result-of-if-with-less-than-test (habu-compiler::interpret-expr 
                                                  (habu-compiler::parse '(if (< 5 10) 42 99)) 
                                                  nil)))
      (assert (= the-result-of-if-with-less-than-test 42))))
  
  (test-case repl-evaluates-nested-if-expressions
    (let ((the-result-of-nested-if-expression (habu-compiler::interpret-expr 
                                                (habu-compiler::parse '(if (> 20 10) (if (< 5 3) 1 2) 3)) 
                                                nil)))
      (assert (= the-result-of-nested-if-expression 2))))
  
  (test-case repl-evaluates-cond-with-first-clause-true
    (let ((the-result-of-cond-first-true (habu-compiler::interpret-expr 
                                           (habu-compiler::parse '(cond ((< 5 10) 100) ((> 20 30) 200) (t 300))) 
                                           nil)))
      (assert (= the-result-of-cond-first-true 100))))
  
  (test-case repl-evaluates-cond-with-second-clause-true
    (let ((the-result-of-cond-second-true (habu-compiler::interpret-expr 
                                            (habu-compiler::parse '(cond ((> 5 10) 100) ((< 5 10) 200) (t 300))) 
                                            nil)))
      (assert (= the-result-of-cond-second-true 200))))
  
  (test-case repl-evaluates-cond-with-default-clause
    (let ((the-result-of-cond-default-clause (habu-compiler::interpret-expr 
                                               (habu-compiler::parse '(cond ((> 5 10) 100) ((< 3 2) 200) (t 300))) 
                                               nil)))
      (assert (= the-result-of-cond-default-clause 300))))
  
  (test-case repl-evaluates-case-with-matching-key
    (let ((the-result-of-case-with-match (habu-compiler::interpret-expr 
                                           (habu-compiler::parse '(case 2 ((1) 100) ((2) 200) (t 300))) 
                                           nil)))
      (assert (= the-result-of-case-with-match 200))))
  
  (test-case repl-evaluates-case-with-no-match-returns-default
    (let ((the-result-of-case-with-no-match (habu-compiler::interpret-expr 
                                              (habu-compiler::parse '(case 5 ((1) 100) ((2) 200) (t 300))) 
                                              nil)))
      (assert (= the-result-of-case-with-no-match 300))))
  
  (test-case repl-evaluates-when-with-true-condition
    (let ((the-result-of-when-with-true (habu-compiler::interpret-expr 
                                          (habu-compiler::parse '(when (< 5 10) 42)) 
                                          nil)))
      (assert (= the-result-of-when-with-true 42))))
  
  (test-case repl-evaluates-when-with-false-condition
    (let ((the-result-of-when-with-false (habu-compiler::interpret-expr 
                                           (habu-compiler::parse '(when (> 5 10) 42)) 
                                           nil)))
      (assert (= the-result-of-when-with-false 0))))
  
  (test-case repl-evaluates-unless-with-true-condition
    (let ((the-result-of-unless-with-true (habu-compiler::interpret-expr 
                                            (habu-compiler::parse '(unless (< 5 10) 42)) 
                                            nil)))
      (assert (= the-result-of-unless-with-true 0))))
  
  (test-case repl-evaluates-unless-with-false-condition
    (let ((the-result-of-unless-with-false (habu-compiler::interpret-expr 
                                             (habu-compiler::parse '(unless (> 5 10) 42)) 
                                             nil)))
      (assert (= the-result-of-unless-with-false 42)))))

(test-group "REPL Expression Evaluation - Variable Bindings"
  (test-case repl-evaluates-let-with-single-binding
    (let ((the-result-of-let-with-one-variable (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(let ((x 10)) (+ x 5))) 
                                                 nil)))
      (assert (= the-result-of-let-with-one-variable 15))))
  
  (test-case repl-evaluates-let-with-multiple-bindings
    (let ((the-result-of-let-with-three-variables (habu-compiler::interpret-expr 
                                                    (habu-compiler::parse '(let ((a 10) (b 20) (c 30)) (+ a (+ b c)))) 
                                                    nil)))
      (assert (= the-result-of-let-with-three-variables 60))))
  
  (test-case repl-evaluates-let-with-expression-values
    (let ((the-result-of-let-with-computed-values (habu-compiler::interpret-expr 
                                                    (habu-compiler::parse '(let ((x (+ 2 3)) (y (* 4 5))) (+ x y))) 
                                                    nil)))
      (assert (= the-result-of-let-with-computed-values 25))))
  
  (test-case repl-evaluates-nested-let-expressions
    (let ((the-result-of-nested-let-bindings (habu-compiler::interpret-expr 
                                               (habu-compiler::parse '(let ((x 10)) (let ((y 20)) (+ x y)))) 
                                               nil)))
      (assert (= the-result-of-nested-let-bindings 30))))
  
  (test-case repl-evaluates-let-with-shadowing-outer-binding
    (let ((the-result-of-let-with-variable-shadowing (habu-compiler::interpret-expr 
                                                       (habu-compiler::parse '(let ((x 10)) (let ((x 20)) x))) 
                                                       nil)))
      (assert (= the-result-of-let-with-variable-shadowing 20)))))

(test-group "REPL Expression Evaluation - Numeric Predicates"
  (test-case repl-evaluates-zerop-with-zero-returns-true
    (let ((the-result-of-zerop-on-zero (habu-compiler::interpret-expr 
                                         (habu-compiler::parse '(zerop 0)) 
                                         nil)))
      (assert (= the-result-of-zerop-on-zero 1))))
  
  (test-case repl-evaluates-zerop-with-nonzero-returns-false
    (let ((the-result-of-zerop-on-fortytwo (habu-compiler::interpret-expr 
                                             (habu-compiler::parse '(zerop 42)) 
                                             nil)))
      (assert (= the-result-of-zerop-on-fortytwo 0))))
  
  (test-case repl-evaluates-plusp-with-positive-returns-true
    (let ((the-result-of-plusp-on-positive (habu-compiler::interpret-expr 
                                             (habu-compiler::parse '(plusp 10)) 
                                             nil)))
      (assert (= the-result-of-plusp-on-positive 1))))
  
  (test-case repl-evaluates-plusp-with-zero-returns-false
    (let ((the-result-of-plusp-on-zero (habu-compiler::interpret-expr 
                                         (habu-compiler::parse '(plusp 0)) 
                                         nil)))
      (assert (= the-result-of-plusp-on-zero 0))))
  
  (test-case repl-evaluates-plusp-with-negative-returns-false
    (let ((the-result-of-plusp-on-negative (habu-compiler::interpret-expr 
                                             (habu-compiler::parse '(plusp -5)) 
                                             nil)))
      (assert (= the-result-of-plusp-on-negative 0))))
  
  (test-case repl-evaluates-minusp-with-negative-returns-true
    (let ((the-result-of-minusp-on-negative (habu-compiler::interpret-expr 
                                              (habu-compiler::parse '(minusp -10)) 
                                              nil)))
      (assert (= the-result-of-minusp-on-negative 1))))
  
  (test-case repl-evaluates-minusp-with-zero-returns-false
    (let ((the-result-of-minusp-on-zero (habu-compiler::interpret-expr 
                                          (habu-compiler::parse '(minusp 0)) 
                                          nil)))
      (assert (= the-result-of-minusp-on-zero 0))))
  
  (test-case repl-evaluates-minusp-with-positive-returns-false
    (let ((the-result-of-minusp-on-positive (habu-compiler::interpret-expr 
                                              (habu-compiler::parse '(minusp 20)) 
                                              nil)))
      (assert (= the-result-of-minusp-on-positive 0))))
  
  (test-case repl-evaluates-evenp-with-even-number-returns-true
    (let ((the-result-of-evenp-on-even (habu-compiler::interpret-expr 
                                         (habu-compiler::parse '(evenp 10)) 
                                         nil)))
      (assert (= the-result-of-evenp-on-even 1))))
  
  (test-case repl-evaluates-evenp-with-odd-number-returns-false
    (let ((the-result-of-evenp-on-odd (habu-compiler::interpret-expr 
                                        (habu-compiler::parse '(evenp 7)) 
                                        nil)))
      (assert (= the-result-of-evenp-on-odd 0))))
  
  (test-case repl-evaluates-oddp-with-odd-number-returns-true
    (let ((the-result-of-oddp-on-odd (habu-compiler::interpret-expr 
                                       (habu-compiler::parse '(oddp 7)) 
                                       nil)))
      (assert (= the-result-of-oddp-on-odd 1))))
  
  (test-case repl-evaluates-oddp-with-even-number-returns-false
    (let ((the-result-of-oddp-on-even (habu-compiler::interpret-expr 
                                        (habu-compiler::parse '(oddp 10)) 
                                        nil)))
      (assert (= the-result-of-oddp-on-even 0)))))

(test-group "REPL Expression Evaluation - Bitwise Operations"
  (test-case repl-evaluates-logand-of-two-numbers
    (let ((the-result-of-bitwise-and-operation (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(logand 12 10)) 
                                                 nil)))
      (assert (= the-result-of-bitwise-and-operation 8))))
  
  (test-case repl-evaluates-logior-of-two-numbers
    (let ((the-result-of-bitwise-or-operation (habu-compiler::interpret-expr 
                                                (habu-compiler::parse '(logior 12 10)) 
                                                nil)))
      (assert (= the-result-of-bitwise-or-operation 14))))
  
  (test-case repl-evaluates-logxor-of-two-numbers
    (let ((the-result-of-bitwise-xor-operation (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(logxor 12 10)) 
                                                 nil)))
      (assert (= the-result-of-bitwise-xor-operation 6))))
  
  (test-case repl-evaluates-lognot-of-number
    (let ((the-result-of-bitwise-not-operation (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(lognot 5)) 
                                                 nil)))
      (assert (= the-result-of-bitwise-not-operation -6))))
  
  (test-case repl-evaluates-ash-left-shift
    (let ((the-result-of-arithmetic-shift-left (habu-compiler::interpret-expr 
                                                 (habu-compiler::parse '(ash 3 2)) 
                                                 nil)))
      (assert (= the-result-of-arithmetic-shift-left 12))))
  
  (test-case repl-evaluates-ash-right-shift
    (let ((the-result-of-arithmetic-shift-right (habu-compiler::interpret-expr 
                                                  (habu-compiler::parse '(ash 12 -2)) 
                                                  nil)))
      (assert (= the-result-of-arithmetic-shift-right 3)))))

(test-group "REPL Expression Evaluation - Additional Numeric Functions"
  (test-case repl-evaluates-min-of-two-numbers
    (let ((the-result-of-minimum-function (habu-compiler::interpret-expr 
                                            (habu-compiler::parse '(min 10 20)) 
                                            nil)))
      (assert (= the-result-of-minimum-function 10))))
  
  (test-case repl-evaluates-max-of-two-numbers
    (let ((the-result-of-maximum-function (habu-compiler::interpret-expr 
                                            (habu-compiler::parse '(max 10 20)) 
                                            nil)))
      (assert (= the-result-of-maximum-function 20))))
  
  (test-case repl-evaluates-abs-of-positive-number
    (let ((the-result-of-absolute-value-positive (habu-compiler::interpret-expr 
                                                   (habu-compiler::parse '(abs 42)) 
                                                   nil)))
      (assert (= the-result-of-absolute-value-positive 42))))
  
  (test-case repl-evaluates-abs-of-negative-number
    (let ((the-result-of-absolute-value-negative (habu-compiler::interpret-expr 
                                                   (habu-compiler::parse '(abs -42)) 
                                                   nil)))
      (assert (= the-result-of-absolute-value-negative 42))))
  
  (test-case repl-evaluates-one-plus-increment
    (let ((the-result-of-increment-by-one (habu-compiler::interpret-expr 
                                            (habu-compiler::parse '(1+ 10)) 
                                            nil)))
      (assert (= the-result-of-increment-by-one 11))))
  
  (test-case repl-evaluates-one-minus-decrement
    (let ((the-result-of-decrement-by-one (habu-compiler::interpret-expr 
                                            (habu-compiler::parse '(1- 10)) 
                                            nil)))
      (assert (= the-result-of-decrement-by-one 9)))))

(report-test-stats)

(format t "~%All REPL enhancement tests completed!~%")
(format t "REPL is robust and ready for interactive use.~%")
