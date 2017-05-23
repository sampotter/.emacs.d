;;; package --- Summary:
;;; Commentary:
;;; Code:

(install-package-if-necessary 'xml-rpc)
(install-package-if-necessary 'jira)

(require 'jira)

(setf jira-url "jira.vectorworks.net"
	  jira-username "spotter")

(provide 'sfp-jira)
;;; sfp-jira.el ends here
