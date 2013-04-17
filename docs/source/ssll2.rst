A Summary of SMT-LIB Logic 2.0
==================================

We are working on integrating two SMT solvers, therefore it is necessary to understand the SMT-LIB 2.0 logic, which can be used as an input language for both solvers (`AltErgo <http://alt-ergo.lri.fr/>`_, `CVC4 <http://cvc4.cs.nyu.edu/web/>`_). Part of the project is to classify formulas which can be solved by one solver, while not by the others. Therefore knowing how theories and logics are defined in SMT-LIB is also important.

SMT-LIB Logics
----------------

* :math:`\mathcal{S}`: Infinite set of sort symbols, containing BOOL.
* :math:`\mathcal{V}`: Infinite set of sort parameters
* :math:`\mathcal{X}`: Infinite set of variables
* :math:`\mathcal{F}`: Infinite set of function symbols
* :math:`\mathcal{B}`: Boolean values {true, false}
* ...

Sorts
----------------

Sorts over a set of sort symbols :math:`\mathcal{S}` are defined as *Sort* (:math:`\mathcal{S}`).

* :math:`\sigma \in \mathcal{S}` of arity 0 is a sort
* :math:`\sigma \sigma_1,\sigma_2,\sigma_3,...,\sigma_n` is a sort if :math:`\sigma \in \mathcal{S}` of arity :math:`n`, :math:`\sigma_1` to :math:`\sigma_n` are sorts

Signature
-------------

Baiscly, :math:`\Sigma` defines sort symbols and arities, function symbols and ranks, some variables and their sorts.

* :math:`\Sigma^{\mathcal{S}} \subset \mathcal{S}`: sort symbols, containing BOOL
* :math:`\Sigma^{\mathcal{F}} \subset \mathcal{F}`: function symbols, containing equality, conjunction, and negation
* :math:`\Sigma^{\mathcal{S}}` to :math:`\mathbb{ℕ}`: a total mapping from sort symbol to its arity, including *𝙱𝙾𝙾𝙻* :math:`\models` 𝟶
* :math:`\Sigma^{\mathcal{F}}` to *Sort* (:math:`\Sigma^{\mathcal{S}}`)+: a left total mapping from a function symbol to its rank, containing = (:math:`\sigma,\sigma` ,BOOL), :math:`\neg` (BOOL,BOOL), :math:`\land` (BOOL,BOOL,BOOL).
* :math:`\mathcal{X}` to *Sort* (:math:`\Sigma^{\mathcal{S}}`): a partial mapping from a variable to its sort.

Formulas
-----------

Well sorted terms of sort BOOL over :math:`\Sigma`.

Structure
-----------

A can be regarded as a model.

* :math:`A`: the universe (of values) of A, including *BOOL* :math:`^{A}` ={true,false}.
* :math:`\sigma^{A} \subset A`: give the sort :math:`\sigma \in` *Sort* (:math:`\Sigma^{\mathcal{S}}`) a universe :math:`\sigma^{A} \subset A`. For example, *BOOL* :math:`^{A}` is {true,flase} :math:`\in A`. *INT* :math:`^{A}` could be all the integers :math:`\mathbb{Z} \in A`.
* :math:`(f:\sigma) A \in \sigma^{A}`: give the constant symbol :math:`f:σ` a value in the universe of :math:`\sigma`
* :math:`(f:\sigma_1,\sigma_2,...,\sigma_n,\sigma)^{A}`: define the function symbol as a relation from :math:`(\sigma_1,\sigma_2,...,\sigma_n)^{A}` to :math:`\sigma^{A}`. This must include the equality relations (or identity predicate over :math:`\sigma^A`, that is =(:math:`\sigma,\sigma`,BOOL) as standard equality relations from (:math:`\sigma^{A},\sigma^{A}`) to {true,false}).

:math:`\sigma^{A}` is called the extension of :math:`\sigma` in :math:`A`.

Valuation and Interpretation
------------------------------

* Valuations :math:`v`: a partial mapping :math:`v` from :math:`\mathcal{X} \times` *Sort* :math:`(\Sigma^{\mathcal{S}})` to :math:`\sigma^{A}`. That is to give variable :math:`x` of sort :math:`\sigma` a value in :math:`\sigma^{A}`.
* Interpretation :math:`\mathcal{I}: \mathcal{I}=(A,v)`, that is the structure together with the valuations make the :math:`\Sigma`-interpretation.
* Semantics: :math:`\mathcal{I}` will assign a meaning to well-sorted terms by uniquely mapping them into the :math:`A`.
* Satisfiability:
	* If :math:`\varphi` is mapped to true by some :math:`\mathcal{I}`, then it is satisfiable.
	* If :math:`\varphi` is not closed, we say :math:`\mathcal{I}=(A,v)` makes true :math:`\varphi`.
	* If :math:`\varphi` is closed, we say the structure :math:`A` makes true :math:`\varphi`.(Since it does not matter what valuation it is.)
	* If :math:`\varphi` is closed, we say the structure :math:`A` a model of :math:`\varphi`.

Theories
----------


* Traditionally, its a set of axioms
* Here it consists of three parts

	* Signature: :math:`\Sigma`
	* Axioms:
		We think this part is left for the people who implement solvers. Take INT theory as an example, since we have the plus sign in our signature (we just denote it as ADD, so that you know it is only a symbol, not the actual operation), we will have an axiom like ∀x:𝙸𝙽𝚃.y:𝙸𝙽𝚃.∃z:𝙸𝙽𝚃.𝙰𝙳𝙳(x,y,z)↔x+y=z. Therefore, our model (or structure) must contain the correct relations to map 𝙰𝙳𝙳 to the actual addition operation to satisfy this axiom.

		Also, some theories like REAL include those axioms as plain text, like associativity, commutativity, etc.
	* Models: A set of :math:`\Sigma`-structures, all of which are models of the theory.

Logics
--------

* Sublogic: it is a sublogic of SMT-LIB logic
* Restrictions:
	* fixing a signature :math:`\Sigma` and its theory :math:`\mathcal{T}`
	* restricting structures to the models of :math:`\mathcal{T}`
	* restricting input sentences as subset of :math:`\Sigma`-sentences



