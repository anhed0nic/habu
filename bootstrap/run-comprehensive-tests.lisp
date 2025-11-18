;;;; Master Test Runner for All Comprehensive Test Suites
;;;; This file runs all test suites in sequence and provides a summary
;;;; Includes: List Functions, REPL Enhancements, and Coverage Enhancement

(format t "~%~%")
(format t "================================================================================~%")
(format t "  HABU LISP - COMPREHENSIVE TEST SUITE RUNNER~%")
(format t "  Running all beginner feature tests with extensive coverage~%")
(format t "================================================================================~%")

(defvar *total-test-suites-run* 0)
(defvar *total-test-suites-passed* 0)
(defvar *total-test-suites-failed* 0)
(defvar *aggregate-test-count* 0)
(defvar *aggregate-test-passed* 0)
(defvar *aggregate-test-failed* 0)

(defun run-test-suite-file-and-capture-results (the-full-path-to-test-suite-file the-descriptive-name-of-test-suite)
  "Load and run a test suite file, capturing its results for aggregation"
  (format t "~%~%")
  (format t "********************************************************************************~%")
  (format t "  Starting Test Suite: ~A~%" the-descriptive-name-of-test-suite)
  (format t "********************************************************************************~%")
  
  (let ((the-test-count-before-running-suite habu-compiler::*test-count*)
        (the-test-passed-before-running-suite habu-compiler::*test-passed*)
        (the-test-failed-before-running-suite habu-compiler::*test-failed*))
    
    (handler-case
        (progn
          (load the-full-path-to-test-suite-file)
          
          (let ((the-number-of-tests-in-this-suite (- habu-compiler::*test-count* the-test-count-before-running-suite))
                (the-number-of-passed-tests-in-this-suite (- habu-compiler::*test-passed* the-test-passed-before-running-suite))
                (the-number-of-failed-tests-in-this-suite (- habu-compiler::*test-failed* the-test-failed-before-running-suite)))
            
            (incf *total-test-suites-run*)
            (incf *aggregate-test-count* the-number-of-tests-in-this-suite)
            (incf *aggregate-test-passed* the-number-of-passed-tests-in-this-suite)
            (incf *aggregate-test-failed* the-number-of-failed-tests-in-this-suite)
            
            (if (= the-number-of-failed-tests-in-this-suite 0)
                (progn
                  (incf *total-test-suites-passed*)
                  (format t "~%~A~%" (habu-compiler::color-green "✓ TEST SUITE PASSED"))
                  (format t "~A: ~D tests, all passed~%" 
                          the-descriptive-name-of-test-suite 
                          the-number-of-tests-in-this-suite))
                (progn
                  (incf *total-test-suites-failed*)
                  (format t "~%~A~%" (habu-compiler::color-red "✗ TEST SUITE FAILED"))
                  (format t "~A: ~D tests, ~D passed, ~D failed~%" 
                          the-descriptive-name-of-test-suite 
                          the-number-of-tests-in-this-suite
                          the-number-of-passed-tests-in-this-suite
                          the-number-of-failed-tests-in-this-suite)))))
      
      (error (the-error-condition-that-occurred)
        (incf *total-test-suites-run*)
        (incf *total-test-suites-failed*)
        (format t "~%~A~%" (habu-compiler::color-red "✗ TEST SUITE CRASHED"))
        (format t "Error loading or running ~A: ~A~%" 
                the-descriptive-name-of-test-suite 
                the-error-condition-that-occurred)))))

(defun display-final-aggregate-test-summary ()
  "Display the final summary of all test suites run"
  (format t "~%~%")
  (format t "================================================================================~%")
  (format t "  FINAL AGGREGATE TEST SUMMARY~%")
  (format t "================================================================================~%")
  (format t "~%")
  (format t "Test Suites Run:    ~D~%" *total-test-suites-run*)
  (if (> *total-test-suites-failed* 0)
      (progn
        (format t "Test Suites Passed: ~A~%" 
                (habu-compiler::color-green (format nil "~D" *total-test-suites-passed*)))
        (format t "Test Suites Failed: ~A~%" 
                (habu-compiler::color-red (format nil "~D" *total-test-suites-failed*))))
      (format t "Test Suites Passed: ~A~%" 
              (habu-compiler::color-green (format nil "~D/~D" *total-test-suites-passed* *total-test-suites-run*))))
  
  (format t "~%")
  (format t "Total Individual Tests:  ~D~%" *aggregate-test-count*)
  (if (> *aggregate-test-failed* 0)
      (progn
        (format t "Total Tests Passed:      ~A~%" 
                (habu-compiler::color-green (format nil "~D" *aggregate-test-passed*)))
        (format t "Total Tests Failed:      ~A~%" 
                (habu-compiler::color-red (format nil "~D" *aggregate-test-failed*))))
      (format t "Total Tests Passed:      ~A~%" 
              (habu-compiler::color-green (format nil "~D/~D" *aggregate-test-passed* *aggregate-test-count*))))
  
  (format t "~%")
  (if (and (= *total-test-suites-failed* 0) (= *aggregate-test-failed* 0))
      (progn
        (format t "~A~%" (habu-compiler::color-green "================================================================================"))
        (format t "~A~%" (habu-compiler::color-green "  ✓ ✓ ✓ ALL TESTS PASSED! ✓ ✓ ✓"))
        (format t "~A~%" (habu-compiler::color-green "================================================================================"))
        (format t "~%")
        (format t "Congratulations! All ~D test suites with ~D total tests passed successfully!~%" 
                *total-test-suites-run* 
                *aggregate-test-count*)
        (format t "The beginner features are fully implemented and thoroughly tested.~%"))
      (progn
        (format t "~A~%" (habu-compiler::color-red "================================================================================"))
        (format t "~A~%" (habu-compiler::color-red "  ✗ SOME TESTS FAILED ✗"))
        (format t "~A~%" (habu-compiler::color-red "================================================================================"))
        (format t "~%")
        (format t "Please review the failed tests above and fix any issues.~%")))
  
  (format t "~%"))

(format t "~%Initializing comprehensive test suite execution...~%")
(format t "This will test all beginner features with extensive coverage.~%")

(run-test-suite-file-and-capture-results 
 "test_list_functions_comprehensive.lisp" 
 "Comprehensive List Functions")

(run-test-suite-file-and-capture-results 
 "test_repl_enhancements.lisp" 
 "REPL Enhancement Tests")

(run-test-suite-file-and-capture-results 
 "test_coverage_enhancement.lisp" 
 "Test Coverage Enhancement")

(display-final-aggregate-test-summary)

(format t "~%Test suite execution complete.~%")
(format t "~%All comprehensive tests for beginner features have been executed.~%")
(format t "Review the summary above for detailed results.~%")
