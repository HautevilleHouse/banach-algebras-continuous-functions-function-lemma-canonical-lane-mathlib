import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure SubalgebraPackage {X : CompactHausdorffSpace}
    (C : ContinuousFunctionAlgebraPackage X) where
  carrier : Set (C.carrier)
  subalgebra : Subalgebra ℝ C.carrier
  separatesPoints : ∀ x y : X.carrier, x ≠ y → ∃ f : C.carrier, f x ≠ f y
  containsConstant : ∀ r : ℝ, ∃ f : C.carrier, ∀ x : X.carrier, f x = r

structure StoneWeierstrassPackage {X : CompactHausdorffSpace}
    {C : ContinuousFunctionAlgebraPackage X} (S : SubalgebraPackage C) where
  dense : closure (S.carrier) = Set.univ

structure StoneWeierstrassEvidence {X : CompactHausdorffSpace}
    {C : ContinuousFunctionAlgebraPackage X} {S : SubalgebraPackage C}
    (W : StoneWeierstrassPackage S) where
  denseClosed : W.dense

def StoneWeierstrassClosed {X : CompactHausdorffSpace}
    {C : ContinuousFunctionAlgebraPackage X} {S : SubalgebraPackage C}
    (W : StoneWeierstrassPackage S) : Prop :=
  W.dense

theorem stone_weierstrass_closed_from_evidence {X : CompactHausdorffSpace}
    {C : ContinuousFunctionAlgebraPackage X} {S : SubalgebraPackage C}
    (W : StoneWeierstrassPackage S) (E : StoneWeierstrassEvidence W) :
    StoneWeierstrassClosed W :=
  E.denseClosed

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse