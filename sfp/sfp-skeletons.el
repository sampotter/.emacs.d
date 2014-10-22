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

(provide 'sfp-skeletons)
