\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[2024/11/11 v0.1 Resume Class]
\LoadClass[letterpaper,11pt]{article}

\RequirePackage{latexsym}
\RequirePackage[empty]{fullpage}
\RequirePackage{titlesec}
\RequirePackage{marvosym}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage{verbatim}
\RequirePackage{enumitem}
\RequirePackage[dvipsnames,svgnames,x11names,hyperref]{xcolor}
\definecolor{SpiritPurple}{HTML}{4b2e83}
\definecolor{AccentLavender}{HTML}{c5b4e3}
\RequirePackage[hidelinks]{hyperref}
\hypersetup{colorlinks, urlcolor=SpiritPurple}
\RequirePackage{fancyhdr}
\RequirePackage[english]{babel}
\RequirePackage{tabularx}
\RequirePackage{hyphenat}
\RequirePackage{fontawesome}
\RequirePackage{bold-extra}
\input{glyphtounicode}

\let\oldhref\href
\renewcommand{\href}[2]{\oldhref{#1}{\underline{\bfseries#2}}}


%---------- FONT OPTIONS ----------
% sans-serif
% \RequirePackage[sfdefault]{FiraSans}
% \RequirePackage[sfdefault]{roboto}
% \RequirePackage[sfdefault]{noto-sans}
% \RequirePackage[default]{sourcesanspro}

% serif
% \RequirePackage{CormorantGaramond}
% \RequirePackage{charter}

% \RequirePackage[light]{antpolt}
% \RequirePackage[T1]{fontenc}

% \RequirePackage{libertinus}
% \RequirePackage[T1]{fontenc}

\RequirePackage[math]{iwona}
\RequirePackage[T1]{fontenc}


\pagestyle{fancy}
\fancyhf{} % clear all header and footer fields
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Adjust margins
\addtolength{\oddsidemargin}{-0.5in}
\addtolength{\evensidemargin}{-0.5in}
\addtolength{\textwidth}{1in}
\addtolength{\topmargin}{-.5in}
\addtolength{\textheight}{1.0in}

\urlstyle{same}

\raggedbottom
\raggedright
\setlength{\tabcolsep}{0in}

% Sections formatting
\titleformat{\section}{
  \vspace{-4pt}\scshape\raggedright\large
}{}{0em}{}[\color{black}\titlerule \vspace{-5pt}]

% Ensure that generate pdf is machine readable/ATS parsable
\pdfgentounicode=1

%-------------------------
% Custom commands

\newcommand{\resumeItem}[1]{
  \item\small{
    {#1 \vspace{-2pt}}
  }
}


\newcommand{\resumeSubheading}[4]{
  \vspace{-2pt}\item
    \begin{tabular*}{0.97\textwidth}[t]{l@{\extracolsep{\fill}}r}
      \textbf{#1} & #2 \\
      \textit{\small#3} & \textit{\small #4} \\
    \end{tabular*}\vspace{-7pt}
}

\newcommand{\resumeResearchSubheading}[6]{
  \vspace{-2pt}\item
    \begin{tabular*}{0.97\textwidth}[t]{l@{\extracolsep{\fill}}r}
      \textbf{#1} & \textbf{#2} \\
      \textit{\small#3} & \textit{\small #4} \\
      \textit{\small#5} & \textit{\small #6} \\
    \end{tabular*}\vspace{-7pt}
}


\newcommand{\resumeSubSubheading}[2]{
    \vspace{-2pt}\item
    \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
      \textit{\small#1} & \textit{\small #2} \\
    \end{tabular*}\vspace{-7pt}
}


\newcommand{\resumeEducationHeading}[4]{
  \vspace{-2pt}\item
    \begin{tabular*}{0.97\textwidth}[t]{l@{\extracolsep{\fill}}r}
      \textbf{#1} & #2 \\
      \textit{\small#3} & \textit{\small #4} \\
    \end{tabular*}\vspace{-5pt}
}


\newcommand{\resumeProjectHeading}[2]{
    \vspace{-2pt}\item
    \begin{tabular*}{0.97\textwidth}{l@{\extracolsep{\fill}}r}
      \small#1 & #2 \\
    \end{tabular*}\vspace{-7pt}
}


\newcommand{\resumeOrganizationHeading}[4]{
  \vspace{-2pt}\item
    \begin{tabular*}{0.97\textwidth}[t]{l@{\extracolsep{\fill}}r}
      \textbf{#1} & \textit{\small #2} \\
      \textit{\small#3}
    \end{tabular*}\vspace{-7pt}
}

\newcommand{\resumeSubItem}[1]{\resumeItem{#1}\vspace{-4pt}}

\renewcommand\labelitemii{$\vcenter{\hbox{\tiny$\bullet$}}$}

\newcommand{\resumeSubHeadingListStart}{\begin{itemize}[leftmargin=0.15in, label={}]}
\newcommand{\resumeSubHeadingListEnd}{\end{itemize}}
\newcommand{\resumeItemListStart}{\begin{itemize}}
\newcommand{\resumeItemListEnd}{\end{itemize}\vspace{-5pt}}
