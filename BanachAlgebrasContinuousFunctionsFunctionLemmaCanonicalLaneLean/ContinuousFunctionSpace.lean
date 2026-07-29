import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.BanachAlgebraPackage

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure CompactHausdorffSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  compact : CompactSpace carrier
  hausdorff : T2Space carrier

structure ContinuousFunctionSpace (X : CompactHausdorffSpace) where
  carrier : Type u
  pointwiseAlgebra : Algebra ℝ carrier
  supNorm : carrier → ℝ
  normedAlgebra : NormedAlgebra ℝ carrier
  banach : CompleteSpace carrier
  containsConstants : Prop
  separatesPoints : Prop

structure CFSpaceEvidence (X : CompactHausdorffSpace) (C : ContinuousFunctionSpace X) where
  normedAlgebraClosed : NormedAlgebra ℝ C.carrier
  banachClosed : CompleteSpace C.carrier
  containsConstantsClosed : C.containsConstants
  separatesPointsClosed : C.separatesPoints

def CFSpaceClosed (X : CompactHausdorffSpace) (C : ContinuousFunctionSpace X) : Prop :=
  NormedAlgebra ℝ C.carrier ∧ CompleteSpace C.carrier ∧ C.containsConstants ∧ C.separatesPoints

theorem cf_space_closed_from_evidence (X : CompactHausdorffSpace) (C : ContinuousFunctionSpace X) (E : CFSpaceEvidence X C) :
    CFSpaceClosed X C := by
  exact And.intro E.normedAlgebraClosed (And.intro E.banachClosed (And.intro E.containsConstantsClosed E.separatesPointsClosed))

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse