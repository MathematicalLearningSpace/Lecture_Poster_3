\ProvidesClass{ResumeDesignFormat1}
\NeedsTeXFormat{LaTeX2e}
\PassOptionsToClass{a4paper,12pt,twocolumn}{article}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\setcounter{secnumdepth}{-1}
\RequirePackage[hmargin=1cm,vmargin=1cm,twocolumn,columnsep=1cm]{geometry}
\RequirePackage{etoolbox,hyperref,marvosym,needspace,tabularx,xcolor}
\usepackage{calligra}
\usepackage[T1]{fontenc}
\calligra

\renewenvironment{abstract}{
  \normalfont
  \list{}{
    \labelwidth0pt
    \leftmargin0pt \rightmargin\leftmargin
    \listparindent\parindent \itemindent0pt
    \parsep0pt
    \let\fullwidthdisplay\relax}
\item[\hskip\labelsep\bfseries\abstractname\enspace --] \small}{\endlist}


\makeatletter
\makeatother
\endinput