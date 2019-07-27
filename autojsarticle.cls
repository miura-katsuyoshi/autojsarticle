%% autojsarticle class
%%
%% This class automatically select jsarticle base class files
%% for pdflatex, lualatex, xelatex, platex, and uplatex.
%%
%% Copyright (c) 2019 Katsuyoshi MIURA
%%   Twitter: @miurakatsuyoshi
%%   Facebook: miura.katsuyoshi
%%
%% This file is distributed uner the MIT license.
%%
%% This code is based on a part of 'hello.tex' by Takayuki YATO
%% ------------------------------------------------------------
%% 'hello.tex'
%%
%% Copyright (c) 2018,2019 Takayuki YATO (aka. "ZR")
%%   GitHub:   https://github.com/zr-tex8r
%%   Twitter:  @zr_tex8r
%%
%% This file is distributed under the MIT License.
%%

\ProvidesClass{autojsarticle}[2019/7/27 v1.0 Automatically select document class]

%--------------------------------------- engine check
\ifx\my@if@primitive\@undefined%
%% \my@if@primitive
\def\my@if@primitive#1{%
  \edef\my@tmpa{\string#1}\edef\my@tmpb{\meaning#1}%
  \ifx\my@tmpa\my@tmpb \expandafter\@firstoftwo
  \else \expandafter \@secondoftwo \fi}
%% \my@engine : TeX engine type
\let\my@engine=k
\my@if@primitive\pdftexversion{\let\my@engine=P}{} % pdflatex
\my@if@primitive\luatexversion{\let\my@engine=L}{} % lualatex
\my@if@primitive\XeTeXversion{\let\my@engine=X}{} % xelatex
\my@if@primitive\kanjiskip{\let\my@engine=p}{} % platex
\my@if@primitive\kchardef{\let\my@engine=u}{} % uplatex
\fi

\ifx P\my@engine% pdflatex
	\NeedsTeXFormat{LaTeX2e}%
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bxjsarticle}}%
	\ProcessOptions\relax
	\LoadClass[pdflatex,ja=standard]{bxjsarticle}%
	\RequirePackage[pdftex]{graphicx}%
\else\ifx L\my@engine% lualatex
	\NeedsTeXFormat{LaTeX2e}%
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ltjsarticle}}%
	\ProcessOptions\relax
	\LoadClass{ltjsarticle}%
	\RequirePackage[luatex]{graphicx}%
\else\ifx X\my@engine% xelatex
	\NeedsTeXFormat{LaTeX2e}%
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{bxjsarticle}}%
	\ProcessOptions\relax
	\LoadClass[xelatex,ja=standard]{bxjsarticle}%
	\RequirePackage[xetex]{graphicx}%
\else\ifx p\my@engine% platex
	\NeedsTeXFormat{pLaTeX2e}%
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jsarticle}}%
	\ProcessOptions\relax
	\LoadClass{jsarticle}%
	\RequirePackage[dvipdfmx]{graphicx}%
\else\ifx u\my@engine% uplatex
	\NeedsTeXFormat{pLaTeX2e}%
	\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jsarticle}}%
	\ProcessOptions\relax
	\LoadClass[uplatex]{jsarticle}%
	\RequirePackage[dvipdfmx]{graphicx}%
\fi\fi\fi\fi\fi
