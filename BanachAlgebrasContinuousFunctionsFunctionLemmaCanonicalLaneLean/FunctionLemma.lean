import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.GelfandTransform

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure StoneWeierstrassPackage {X : Type u} [TopologicalSpace X]
    (C : ContinuousFunctionAlgebraPackage X) (G : GelfandTransformPackage C) where
  subalgebra : Set (C.algebra.carrier)
  separates_points : ∀ x y : X, x ≠ y → ∃ f : subalgebra, f.val x ≠ f.val y
  contains_constants : (fun (x : X) => 1) ∈ subalgebra
  closed_under_multiplication : ∀ f g : subalgebra, f.val * g.val ∈ subalgebra
  dense : Dense (Subalgebra.topologicalClosure (Subalgebra.span ℝ subalgebra)) (Set.univ)

structure StoneWeierstrassEvidence {X : Type u} [TopologicalSpace X]
    {C : ContinuousFunctionAlgebraPackage X} {G : GelfandTransformPackage C}
    (S : StoneWeierstrassPackage C G) where
  dense_closed : Dense (Subalgebra.topologicalClosure (Subalgebra.span ℝ S.subalgebra)) (Set.univ)

def StoneWeierstrassClosed {X : Type u} [TopologicalSpace X]
    {C : ContinuousFunctionAlgebraPackage X} {G : GelfandTransformPackage C}
    (S : StoneWeierstrassPackage C G) : Prop :=
  Dense (Subalgebra.topologicalClosure (Subalgebra.span ℝ S.subalgebra)) (Set.univ)

theorem stone_weierstrass_closed_from_evidence {X : Type u} [TopologicalSpace X]
    {C : ContinuousFunctionAlgebraPackage X} {G : GelfandTransformPackage C}
    (S : StoneWeierstrassPackage C G) (E : StoneWeierstrassEvidence S) :
    StoneWeierstrassClosed S := by
  exact E.dense_closed

def ConstrainedFunctionLemmaClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem function_lemma_endgame (A : AdmissibleClass) :
    ConstrainedFunctionLemmaClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse