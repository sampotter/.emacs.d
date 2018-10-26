;;; package --- Summary:

;;; Commentary:

;;; Code:

(define-skeleton ifdef-skeleton
  "Inserts a C/C++ #ifdef preprocessor macro."
  "Argument to #ifdef: "
  "#ifdef " str > \n
  _ > \n
  "#endif // " str >)

(define-skeleton c-include-guard-skeleton
  "Inserts a C include guard."
  "Name of include guard: "
  "#ifndef " str "_h" \n
  "#define " str "_h" \n
  \n
  _ \n
  \n
  "#endif // " str "_h")

(define-skeleton cpp-include-guard-skeleton
  "Inserts a C++ include guard."
  "Name of include guard: "
  "#ifndef __" str "_HPP__" \n
  "#define __" str "_HPP__" \n
  \n
  _ \n
  \n
  "#endif // __" str "_HPP__")

(define-skeleton cpp-namespace-skeleton
  "Inserts a C++ namespace."
  "Name of namespace: "
  "namespace " str " {" \n
  > _ \n
  "}" >)

(define-skeleton org-activity-skeleton
  "Inserts a template for logging my activities."
  nil
  > "| Time | Activity |" \n
  > "|------+----------|" \n
  > "| " _ "     |          |" \n)

(define-skeleton org-goal-skeleton
  "Inserts a template for logging time on a goal."
  "What's my goal? "
  > "| Goal | " str " |" > \n
  > "|-+-|" > \n
  > "| " _ " | |" > \n
  > "|-+-|" > \n
  > "| Achieved? | |" > \n)

(define-skeleton el-file-skeleton
  "Inserts a template el file, with appropriate header and footer."
  "What is the name of the package to provide? "
  > ";;; package --- Summary:" \n
  > ";;; Commentary:" \n
  > ";;; Code:" \n
  > \n
  > _ \n
  > \n
  > "(provide '" str ")" \n
  > ";;; " str ".el ends here" \n)

(define-skeleton boost-test-skeleton
  "Inserts the header for a C++ unit test using Boost.Test."
  "What is the name of the unit test? "
  > "#define BOOST_TEST_MODULE " str \n
  > \n
  > "#include <boost/test/included/unit_test.hpp>" \n
  > \n
  > _)

(define-skeleton boost-auto-test-case-skeleton
  "Inserts a BOOST_AUTO_TEST_CASE (...) { ... } template."
  "What is the name of the test case? "
  > "BOOST_AUTO_TEST_CASE (" str ") {" \n
  > _ \n
  > "}"
  > \n)

(define-skeleton boost-fixture-test-skeleton
  "Inserts a BOOST_FIXTURE_TEST_CASE (...) { ... } template."
  > "BOOST_FIXTURE_TEST_CASE ("
  (skeleton-read "Name of the test case: ") ", "
  (skeleton-read "Name of the test fixture: ") ") {" \n
  > _ \n
  > "}"
  > \n)

(define-skeleton wrapped-gl-func-header-skeleton
  "Temporary skeleton for use with VGM mobile port project."
  "Wrapped function's name: "
  "    enum class " str "Error {" ?\n
  "        SUCCESS," ?\n
  ("Error name: " "        " str "," ?\n)
  "#if GL_VERSION_2_1" ?\n
  "        AFTER_GLBEGIN," ?\n
  "#endif" ?\n
  "    };" ?\n
  "    " str "Error " str "("
  ("Parameter: " str "," > ?\n)
  -2
  ");" ?\n)

(define-skeleton wrapped-gl-func-body-skeleton
  "Temporary skeleton for use with VGM mobile port project."
  "Wrapped function's name: "
  "VGM::GL::" str "Error" ?\n
  "VGM::GL::" str "("
  ("Parameter: "
   '(setq v1 0)
   str "," (if (zerop v1) "" '>) \n
   '(incf v1))
  -8
  ") {" ?\n
  > _ ?\n
  "#if GL_VERSION_2_1" ?\n
  "    if (GetError() == Error::INVALID_OPERATION) {" ?\n
  "        return id(" str "Error::AFTER_GLBEGIN);" ?\n
  "    }" ?\n
  "#endif" ?\n
  "    return " str "Error::SUCCESS;" ?\n
  "}" ?\n)

(provide 'sfp-skeletons)
;;; sfp-skeletons.el ends here
