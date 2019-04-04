;;; cds-mode.el --- Major mode for editing Core Data Services (CDS) files -*- lexical-binding: t -*-

;; Copyright (c) 2019 Daniel Kraus <daniel@kraus.my>

;; Author: Daniel Kraus <daniel@kraus.my>
;; URL: https://github.com/dakra/cds-mode.el
;; Keywords: languages cds coredataservices sap abap hana
;; Version: 0.1
;; Package-Requires: ((emacs "25.2"))

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; Major mode for editing Core Data Services (CDS) files.
;; FIXME: Everything.  Only basic font-lock implemented yet.

;;; Code:

(defun cds-imenu-setup ()
  "Setup imenu for cds-mode."
  (add-to-list 'imenu-generic-expression '("Services" "\\(^service +\\)\\(\\_<.+\\_>\\)" 2))
  (add-to-list 'imenu-generic-expression '("Entities" "\\(^entity +\\)\\(\\_<.+\\_>\\)" 2)))

(defvar cds-highlights
  `((,(regexp-opt '("namespace") 'words) . font-lock-reference-face)
    (,(regexp-opt '("entity" "service" "enum" "virtual") 'words) . font-lock-builtin-face)
    ("entity\\ +\\([[:alnum:]]+\\)" . (1 font-lock-function-name-face))
    (,(regexp-opt '("Integer" "Integer64" "Number" "Decimal" "DecimalFloat" "Double"
                    "UUID" "String" "LargeString" "Boolean" "Binary" "LargeBinary"
                    "Date" "Time" "DateTime" "Timestamp") 'words) . font-lock-type-face)))

;;;###autoload
(define-derived-mode cds-mode prog-mode "cds"
  "Major mode for editing Core Data Services (CDS) files."
  (setq font-lock-defaults '(cds-highlights))
  (cds-imenu-setup))

;;;###autoload
(add-to-list 'auto-mode-alist (cons "\\.\\(cds\\|cdl\\|hdbdd\\)\\'" #'cds-mode))

(provide 'cds-mode)
;;; cds-mode.el ends here
