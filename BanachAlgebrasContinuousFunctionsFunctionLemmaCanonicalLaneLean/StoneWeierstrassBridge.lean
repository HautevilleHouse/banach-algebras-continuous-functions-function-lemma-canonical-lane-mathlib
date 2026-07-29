import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.ContinuousFunctionSpace

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure StoneWeierstrassPackage (X : CompactHausdorffSpace) (C : ContinuousFunctionSpace X) where
  subalgebra : Set C.carrier
  subalgebraIsSubalgebra : Subalgebra ℝ C.carrier subalgebra
  containsConstants : Prop
  separatesPoints : Prop
  uniformlyDense : Prop

structure StoneWeierstrassEvidence (X : CompactHausdorffSpace) (C : ContinuousFunctionSpace X) (S : StoneWeierstrassPackage X C) where
  subalgebraIsSubalgebraClosed : S.subalgebraIsSubalgebra
  containsConstantsClosed : S.containsConstants
  separatesPointsClosed : S.separatesPoints
  uniformlyDenseClosed : S.uniformlyDense

def StoneWeierstrassClosed (X : CompactHausdorffSpace) (C : ContinuousFunctionSpace X) (S : StoneWeierstrassPackage X C) : Prop :=
  S.subalgebraIsSubalgebra ∧ S.containsConstants ∧ S.separatesPoints ∧ S.uniformlyDense

theorem stone_weierstrass_closed_from_evidence (X : CompactHausdorffSpace) (C : ContinuousFunctionSpace X) (S : StoneWeierstrassPackage X C) (E : StoneWeierstrassEvidence X C S) :
    StoneWeierstrassClosed X C S := by
  exact And.intro E.subalgebraIsSubalgebraClosed (And.intro E.containsConstantsClosed (And.intro E.separatesPointsClosed E.uniformlyDenseClosed))

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse