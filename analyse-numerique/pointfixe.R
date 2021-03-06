## Copyright (C) 2018 Vincent Goulet
##
## Ce fichier fait partie du projet
## «Méthodes numériques en actuariat avec R»
## http://github.com/vigou3/methodes-numeriques-en-actuariat
##
## Cette création est mise à disposition selon le contrat
## Attribution-Partage dans les mêmes conditions 4.0
## International de Creative Commons.
## http://creativecommons.org/licenses/by-sa/4.0/

pointfixe <- function(FUN, start, TOL = 1E-6, MAX.ITER = 100, echo = FALSE)
{
    x <- start

    if (echo)
        expr <- expression(print(xt <- x))
    else
        expr <- expression(xt <- x)

    i <- 0

    repeat
    {
        eval(expr)

        x <- FUN(xt)

        if (abs(x - xt)/abs(x) < TOL)
            break

        if (MAX.ITER < (i <- i + 1))
            stop('Maximum number of iterations reached without convergence')
    }
    list(fixed.point=x, nb.iter=i)
}
