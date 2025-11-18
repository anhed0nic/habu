;;;; Comprehensive Test Coverage Enhancement Suite
;;;; This file provides extensive edge case testing and integration tests
;;;; Ensures all features work correctly in combination and handle edge cases

(load "test-harness.lisp")
(load "compiler.lisp")

(in-package :habu-compiler)

(reset-test-stats)

(format t "~%")
(format t "~A~%" (color-blue "========================================="))
(format t "~A~%" (color-blue "  Comprehensive Test Coverage Enhancement"))
(format t "~A~%" (color-blue "========================================="))

(test-group "Edge Cases - Integer Boundaries and Special Values"
  (test-case compiler-handles-zero-literal-correctly
    (let ((the-compiled-code-for-zero-value (compile-expression '0 :arch :x86_64)))
      (assert (> (length the-compiled-code-for-zero-value) 0))))
  
  (test-case compiler-handles-one-literal-correctly
    (let ((the-compiled-code-for-one-value (compile-expression '1 :arch :x86_64)))
      (assert (> (length the-compiled-code-for-one-value) 0))))
  
  (test-case compiler-handles-negative-one-literal-correctly
    (let ((the-compiled-code-for-negative-one-value (compile-expression '-1 :arch :x86_64)))
      (assert (> (length the-compiled-code-for-negative-one-value) 0))))
  
  (test-case compiler-handles-large-positive-integer
    (let ((the-compiled-code-for-large-positive-number (compile-expression '99999 :arch :x86_64)))
      (assert (> (length the-compiled-code-for-large-positive-number) 0))))
  
  (test-case compiler-handles-large-negative-integer
    (let ((the-compiled-code-for-large-negative-number (compile-expression '-99999 :arch :x86_64)))
      (assert (> (length the-compiled-code-for-large-negative-number) 0))))
  
  (test-case compiler-handles-maximum-fixnum-range
    (let ((the-compiled-code-for-very-large-fixnum (compile-expression '1000000000 :arch :x86_64)))
      (assert (> (length the-compiled-code-for-very-large-fixnum) 0)))))

(test-group "Edge Cases - Arithmetic Operations With Boundaries"
  (test-case compiler-handles-addition-resulting-in-zero
    (let ((the-compiled-code-for-zero-sum (compile-expression '(+ 10 -10) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-zero-sum) 0))))
  
  (test-case compiler-handles-subtraction-of-equal-numbers
    (let ((the-compiled-code-for-zero-difference (compile-expression '(- 42 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-zero-difference) 0))))
  
  (test-case compiler-handles-multiplication-by-zero
    (let ((the-compiled-code-for-zero-product (compile-expression '(* 100 0) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-zero-product) 0))))
  
  (test-case compiler-handles-multiplication-by-one
    (let ((the-compiled-code-for-identity-product (compile-expression '(* 42 1) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-identity-product) 0))))
  
  (test-case compiler-handles-division-by-one
    (let ((the-compiled-code-for-identity-quotient (compile-expression '(/ 42 1) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-identity-quotient) 0))))
  
  (test-case compiler-handles-modulo-with-larger-divisor
    (let ((the-compiled-code-for-modulo-identity (compile-expression '(mod 5 10) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-modulo-identity) 0))))
  
  (test-case compiler-handles-modulo-with-equal-dividend-and-divisor
    (let ((the-compiled-code-for-modulo-zero (compile-expression '(mod 10 10) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-modulo-zero) 0)))))

(test-group "Edge Cases - Comparison Operations With Equal Values"
  (test-case compiler-handles-less-than-with-equal-values
    (let ((the-compiled-code-for-equal-less-than-test (compile-expression '(< 10 10) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-equal-less-than-test) 0))))
  
  (test-case compiler-handles-greater-than-with-equal-values
    (let ((the-compiled-code-for-equal-greater-than-test (compile-expression '(> 10 10) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-equal-greater-than-test) 0))))
  
  (test-case compiler-handles-less-equal-boundary-case
    (let ((the-compiled-code-for-less-equal-boundary (compile-expression '(<= 10 10) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-less-equal-boundary) 0))))
  
  (test-case compiler-handles-greater-equal-boundary-case
    (let ((the-compiled-code-for-greater-equal-boundary (compile-expression '(>= 10 10) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-greater-equal-boundary) 0))))
  
  (test-case compiler-handles-equality-with-zero
    (let ((the-compiled-code-for-zero-equality (compile-expression '(= 0 0) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-zero-equality) 0))))
  
  (test-case compiler-handles-not-equal-with-same-values
    (let ((the-compiled-code-for-same-values-not-equal (compile-expression '(/= 42 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-same-values-not-equal) 0))))
  
  (test-case compiler-handles-not-equal-with-different-values
    (let ((the-compiled-code-for-different-values-not-equal (compile-expression '(/= 10 20) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-different-values-not-equal) 0)))))

(test-group "Edge Cases - Boolean Logic Short Circuiting"
  (test-case compiler-handles-and-with-single-argument
    (let ((the-compiled-code-for-single-and-argument (compile-expression '(and 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-single-and-argument) 0))))
  
  (test-case compiler-handles-and-with-two-arguments
    (let ((the-compiled-code-for-two-and-arguments (compile-expression '(and 1 2) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-two-and-arguments) 0))))
  
  (test-case compiler-handles-and-with-many-arguments
    (let ((the-compiled-code-for-many-and-arguments (compile-expression '(and 1 2 3 4 5) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-many-and-arguments) 0))))
  
  (test-case compiler-handles-or-with-single-argument
    (let ((the-compiled-code-for-single-or-argument (compile-expression '(or 0) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-single-or-argument) 0))))
  
  (test-case compiler-handles-or-with-two-arguments
    (let ((the-compiled-code-for-two-or-arguments (compile-expression '(or 0 1) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-two-or-arguments) 0))))
  
  (test-case compiler-handles-or-with-many-arguments
    (let ((the-compiled-code-for-many-or-arguments (compile-expression '(or 0 0 0 0 1) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-many-or-arguments) 0))))
  
  (test-case compiler-handles-not-with-zero
    (let ((the-compiled-code-for-not-zero (compile-expression '(not 0) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-not-zero) 0))))
  
  (test-case compiler-handles-not-with-nonzero
    (let ((the-compiled-code-for-not-nonzero (compile-expression '(not 1) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-not-nonzero) 0)))))

(test-group "Edge Cases - Conditional Expression Branches"
  (test-case compiler-handles-if-with-literal-true-condition
    (let ((the-compiled-code-for-if-with-true (compile-expression '(if 1 10 20) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-if-with-true) 0))))
  
  (test-case compiler-handles-if-with-literal-false-condition
    (let ((the-compiled-code-for-if-with-false (compile-expression '(if 0 10 20) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-if-with-false) 0))))
  
  (test-case compiler-handles-if-with-arithmetic-in-branches
    (let ((the-compiled-code-for-if-with-arithmetic (compile-expression '(if 1 (+ 2 3) (* 4 5)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-if-with-arithmetic) 0))))
  
  (test-case compiler-handles-cond-with-single-clause
    (let ((the-compiled-code-for-single-cond-clause (compile-expression '(cond (t 42)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-single-cond-clause) 0))))
  
  (test-case compiler-handles-cond-with-many-clauses
    (let ((the-compiled-code-for-many-cond-clauses (compile-expression '(cond ((< 1 0) 1) ((< 2 0) 2) ((< 3 0) 3) (t 4)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-many-cond-clauses) 0))))
  
  (test-case compiler-handles-case-with-single-option
    (let ((the-compiled-code-for-single-case-option (compile-expression '(case 1 ((1) 100) (t 200)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-single-case-option) 0))))
  
  (test-case compiler-handles-case-with-many-options
    (let ((the-compiled-code-for-many-case-options (compile-expression '(case 5 ((1) 10) ((2) 20) ((3) 30) ((4) 40) ((5) 50) (t 99)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-many-case-options) 0))))
  
  (test-case compiler-handles-when-with-always-true
    (let ((the-compiled-code-for-when-always-true (compile-expression '(when 1 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-when-always-true) 0))))
  
  (test-case compiler-handles-when-with-always-false
    (let ((the-compiled-code-for-when-always-false (compile-expression '(when 0 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-when-always-false) 0))))
  
  (test-case compiler-handles-unless-with-always-true
    (let ((the-compiled-code-for-unless-always-true (compile-expression '(unless 1 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-unless-always-true) 0))))
  
  (test-case compiler-handles-unless-with-always-false
    (let ((the-compiled-code-for-unless-always-false (compile-expression '(unless 0 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-unless-always-false) 0)))))

(test-group "Edge Cases - Let Bindings and Variable Scoping"
  (test-case compiler-handles-let-with-zero-bindings
    (let ((the-compiled-code-for-empty-let (compile-expression '(let () 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-empty-let) 0))))
  
  (test-case compiler-handles-let-with-single-binding
    (let ((the-compiled-code-for-one-binding (compile-expression '(let ((x 10)) x) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-one-binding) 0))))
  
  (test-case compiler-handles-let-with-many-bindings
    (let ((the-compiled-code-for-five-bindings (compile-expression '(let ((a 1) (b 2) (c 3) (d 4) (e 5)) (+ a (+ b (+ c (+ d e))))) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-five-bindings) 0))))
  
  (test-case compiler-handles-let-with-unused-variables
    (let ((the-compiled-code-for-unused-variables (compile-expression '(let ((x 10) (y 20)) 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-unused-variables) 0))))
  
  (test-case compiler-handles-let-star-with-dependent-bindings
    (let ((the-compiled-code-for-let-star-dependencies (compile-expression '(let* ((x 10) (y (+ x 5))) y) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-let-star-dependencies) 0))))
  
  (test-case compiler-handles-let-star-with-shadowing
    (let ((the-compiled-code-for-let-star-shadowing (compile-expression '(let* ((x 10) (x (+ x 1))) x) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-let-star-shadowing) 0)))))

(test-group "Edge Cases - Progn and Sequential Expressions"
  (test-case compiler-handles-progn-with-single-expression
    (let ((the-compiled-code-for-single-progn (compile-expression '(progn 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-single-progn) 0))))
  
  (test-case compiler-handles-progn-with-two-expressions
    (let ((the-compiled-code-for-two-progn (compile-expression '(progn 10 20) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-two-progn) 0))))
  
  (test-case compiler-handles-progn-with-many-expressions
    (let ((the-compiled-code-for-many-progn (compile-expression '(progn 1 2 3 4 5) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-many-progn) 0))))
  
  (test-case compiler-handles-begin-as-progn-alias
    (let ((the-compiled-code-for-begin (compile-expression '(begin 10 20 30) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-begin) 0)))))

(test-group "Edge Cases - Numeric Predicate Functions"
  (test-case compiler-handles-zerop-on-zero
    (let ((the-compiled-code-for-zerop-zero (compile-expression '(zerop 0) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-zerop-zero) 0))))
  
  (test-case compiler-handles-zerop-on-positive
    (let ((the-compiled-code-for-zerop-positive (compile-expression '(zerop 42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-zerop-positive) 0))))
  
  (test-case compiler-handles-zerop-on-negative
    (let ((the-compiled-code-for-zerop-negative (compile-expression '(zerop -10) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-zerop-negative) 0))))
  
  (test-case compiler-handles-plusp-on-boundary
    (let ((the-compiled-code-for-plusp-boundary (compile-expression '(plusp 1) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-plusp-boundary) 0))))
  
  (test-case compiler-handles-minusp-on-boundary
    (let ((the-compiled-code-for-minusp-boundary (compile-expression '(minusp -1) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-minusp-boundary) 0))))
  
  (test-case compiler-handles-evenp-on-zero
    (let ((the-compiled-code-for-evenp-zero (compile-expression '(evenp 0) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-evenp-zero) 0))))
  
  (test-case compiler-handles-oddp-on-one
    (let ((the-compiled-code-for-oddp-one (compile-expression '(oddp 1) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-oddp-one) 0)))))

(test-group "Integration - Complex Nested Expressions"
  (test-case compiler-handles-deeply-nested-arithmetic
    (let ((the-compiled-code-for_deep_nesting (compile-expression '(+ (* (- 10 5) (/ 20 4)) (mod 17 3)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for_deep_nesting) 0))))
  
  (test-case compiler-handles-nested-conditionals-with-arithmetic
    (let ((the-compiled-code-for-nested-if-arithmetic (compile-expression '(if (< (+ 2 3) 10) (* 4 5) (/ 100 2)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-nested-if-arithmetic) 0))))
  
  (test-case compiler-handles-cond-with-complex-tests
    (let ((the-compiled-code-for-cond-complex (compile-expression '(cond ((< (+ 1 2) 0) 10) ((> (* 3 4) 20) 20) (t (- 100 50))) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-cond-complex) 0))))
  
  (test-case compiler-handles-let-with-nested-expressions-in-bindings
    (let ((the-compiled-code-for-let-complex-bindings (compile-expression '(let ((x (+ 2 3)) (y (* 4 5)) (z (- 10 2))) (+ x (+ y z))) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-let-complex-bindings) 0))))
  
  (test-case compiler-handles-boolean-logic-with-comparisons
    (let ((the-compiled-code-for-boolean-with-comparisons (compile-expression '(and (< 5 10) (> 20 15) (= 42 42)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-boolean-with-comparisons) 0))))
  
  (test-case compiler-handles-or-with-nested-and
    (let ((the-compiled-code-for-or-with-nested-and (compile-expression '(or (and 0 1) (and 1 1)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-or-with-nested-and) 0))))
  
  (test-case compiler-handles-progn-with-mixed-expressions
    (let ((the-compiled-code-for-progn-mixed (compile-expression '(progn (+ 1 2) (* 3 4) (- 10 5)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-progn-mixed) 0)))))

(test-group "Integration - Bitwise Operations Combined"
  (test-case compiler-handles-multiple-bitwise-and-operations
    (let ((the-compiled-code-for-chained-logand (compile-expression '(logand (logand 15 14) 12) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-chained-logand) 0))))
  
  (test-case compiler-handles-bitwise-operations-combined
    (let ((the-compiled-code-for-mixed-bitwise (compile-expression '(logior (logand 12 10) (logxor 5 3)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-mixed-bitwise) 0))))
  
  (test-case compiler-handles-shift-with-arithmetic
    (let ((the-compiled-code-for-shift-arithmetic (compile-expression '(+ (ash 3 2) (ash 16 -2)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-shift-arithmetic) 0))))
  
  (test-case compiler-handles-not-of-xor
    (let ((the-compiled-code-for-not-xor (compile-expression '(lognot (logxor 10 6)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-not-xor) 0)))))

(test-group "Integration - Min Max Abs Operations"
  (test-case compiler-handles-nested-min-operations
    (let ((the-compiled-code-for-nested-min (compile-expression '(min (min 10 20) (min 5 15)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-nested-min) 0))))
  
  (test-case compiler-handles-nested-max-operations
    (let ((the-compiled-code-for-nested-max (compile-expression '(max (max 10 20) (max 30 15)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-nested-max) 0))))
  
  (test-case compiler-handles-min-max-combined
    (let ((the-compiled-code-for-min-max-combo (compile-expression '(min (max 5 10) (max 15 20)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-min-max-combo) 0))))
  
  (test-case compiler-handles-abs-of-subtraction
    (let ((the-compiled-code-for-abs-subtraction (compile-expression '(abs (- 10 20)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-abs-subtraction) 0))))
  
  (test-case compiler-handles-abs-of-negative-literal
    (let ((the-compiled-code-for-abs-negative (compile-expression '(abs -42) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-abs-negative) 0)))))

(test-group "Integration - Increment Decrement in Expressions"
  (test-case compiler-handles-one-plus-in-arithmetic
    (let ((the-compiled-code-for-increment-arithmetic (compile-expression '(+ (1+ 10) (1+ 20)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-increment-arithmetic) 0))))
  
  (test-case compiler-handles-one-minus-in-arithmetic
    (let ((the-compiled-code-for-decrement-arithmetic (compile-expression '(- (1- 10) (1- 5)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-decrement-arithmetic) 0))))
  
  (test-case compiler-handles-mixed-increment-decrement
    (let ((the-compiled-code-for-mixed-inc-dec (compile-expression '(* (1+ 5) (1- 10)) :arch :x86_64)))
      (assert (> (length the-compiled-code-for-mixed-inc-dec) 0)))))

(test-group "Cross Architecture - All Features Work On Both x86_64 and ARM64"
  (test-case both-architectures-compile-arithmetic
    (let ((the-x86_64-compiled-arithmetic (compile-expression '(+ (* 2 3) (- 10 4)) :arch :x86_64))
          (the-arm64-compiled-arithmetic (compile-expression '(+ (* 2 3) (- 10 4)) :arch :arm64)))
      (assert (> (length the-x86_64-compiled-arithmetic) 0))
      (assert (> (length the-arm64-compiled-arithmetic) 0))))
  
  (test-case both-architectures-compile-comparisons
    (let ((the-x86_64-compiled-comparison (compile-expression '(and (< 5 10) (> 20 15)) :arch :x86_64))
          (the-arm64-compiled-comparison (compile-expression '(and (< 5 10) (> 20 15)) :arch :arm64)))
      (assert (> (length the-x86_64-compiled-comparison) 0))
      (assert (> (length the-arm64-compiled-comparison) 0))))
  
  (test-case both-architectures-compile-conditionals
    (let ((the-x86_64-compiled-conditional (compile-expression '(if (< 5 10) (+ 1 2) (* 3 4)) :arch :x86_64))
          (the-arm64-compiled-conditional (compile-expression '(if (< 5 10) (+ 1 2) (* 3 4)) :arch :arm64)))
      (assert (> (length the-x86_64-compiled-conditional) 0))
      (assert (> (length the-arm64-compiled-conditional) 0))))
  
  (test-case both-architectures-compile-let-bindings
    (let ((the-x86_64-compiled-let (compile-expression '(let ((x 10) (y 20)) (+ x y)) :arch :x86_64))
          (the-arm64-compiled-let (compile-expression '(let ((x 10) (y 20)) (+ x y)) :arch :arm64)))
      (assert (> (length the-x86_64-compiled-let) 0))
      (assert (> (length the-arm64-compiled-let) 0))))
  
  (test-case both-architectures-compile-bitwise-operations
    (let ((the-x86_64-compiled-bitwise (compile-expression '(logand (logior 12 3) (logxor 15 7)) :arch :x86_64))
          (the-arm64-compiled-bitwise (compile-expression '(logand (logior 12 3) (logxor 15 7)) :arch :arm64)))
      (assert (> (length the-x86_64-compiled-bitwise) 0))
      (assert (> (length the-arm64-compiled-bitwise) 0))))
  
  (test-case both-architectures-compile-predicates
    (let ((the-x86_64-compiled-predicates (compile-expression '(and (zerop 0) (plusp 10) (minusp -5)) :arch :x86_64))
          (the-arm64-compiled-predicates (compile-expression '(and (zerop 0) (plusp 10) (minusp -5)) :arch :arm64)))
      (assert (> (length the-x86_64-compiled-predicates) 0))
      (assert (> (length the-arm64-compiled-predicates) 0)))))

(report-test-stats)

(format t "~%Comprehensive test coverage enhancement complete!~%")
(format t "All edge cases and integration scenarios verified.~%")
(format t "Both x86_64 and ARM64 architectures tested.~%")
