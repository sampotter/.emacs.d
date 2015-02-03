(define-skeleton c-include-guard-skeleton
  "Inserts a C include guard."
  "Name of include guard: "
  "#ifndef __" str "_H__" \n
  "#define __" str "_H__" \n
  \n
  _ \n
  \n
  "#endif // __" str "_H__")

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


(provide 'sfp-skeletons)
