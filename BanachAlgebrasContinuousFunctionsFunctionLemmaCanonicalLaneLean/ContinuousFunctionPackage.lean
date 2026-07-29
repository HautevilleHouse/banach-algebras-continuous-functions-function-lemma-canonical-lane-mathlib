import BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.BanachAlgebraFoundation

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure CompactHausdorffSpace where
  carrier : Type u
  topology : TopologicalSpace carrier
  compact : CompactSpace carrier
  hausdorff : T2Space carrier

structure ContinuousFunctionSpace (X : CompactHausdorffSpace) where
  carrier : Type u
  algebra : Algebra ℝ carrier
  norm : carrier → ℝ
  complete : CompleteSpace carrier
  supNorm : ∀ f : carrier, norm f = ⨆ x : X.carrier, ‖f x‖

structure ContinuousFunctionEvidence (C : ContinuousFunctionSpace X) where
  compactnessUsed : Prop
  hausdorffUsed : Prop
  supNormClosed : C.supNorm

def ContinuousFunctionClosed (C : ContinuousFunctionSpace X) : Prop :=
  C.supNorm

theorem continuous_function_closed_from_evidence (C : ContinuousFunctionSpace X) (E : ContinuousFunctionEvidence C) :
    ContinuousFunctionClosed C := by
  exact E.supNormClosed

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse