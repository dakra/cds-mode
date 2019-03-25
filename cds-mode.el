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

(defvar cds-highlights
  `((,(regexp-opt '("namespace") 'words) . font-lock-reference-face)
    (,(regexp-opt '("entity" "service") 'words) . font-lock-builtin-face)
    ("entity\\ +\\([[:alnum:]]+\\)" . (1 font-lock-function-name-face))
    (,(regexp-opt '("Integer" "String" "Boolean") 'words) . font-lock-type-face)))


(define-derived-mode cds-mode prog-mode "cds"
  "Major mode for editing Core Data Services (CDS) files."
  (setq font-lock-defaults '(cds-highlights)))

(provide 'cds-mode)
;;; cds-mode.el ends here
