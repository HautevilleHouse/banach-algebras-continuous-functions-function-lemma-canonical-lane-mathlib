import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.BanachAlgebra

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure ContinuousFunctionAlgebraPackage (X : Type u) [TopologicalSpace X] where
  compact : CompactSpace X
  hausdorff : T2Space X
  algebra : BanachAlgebraPackage
  carrier_eq : algebra.carrier = (X → ℝ)
  sup_norm_eq : ∀ f : algebra.carrier, algebra.norm f = (Set.range fun (x : X) => |f x|).sup' (by
    have h : BddAbove (Set.range fun (x : X) => |f x|) := by
      have : CompactSpace X := compact
      have : Continuous (fun x : X => |f x|) := by
        sorry
      sorry
    exact h)
  pointwise_mul : ∀ f g : algebra.carrier, algebra.mul f g = fun (x : X) => f x * g x
  constant_one : algebra.one = fun (x : X) => 1

structure ContinuousFunctionAlgebraEvidence {X : Type u} [TopologicalSpace X]
    (C : ContinuousFunctionAlgebraPackage X) where
  compact_closed : C.compact
  hausdorff_closed : C.hausdorff
  algebra_closed : BanachAlgebraClosed C.algebra

def ContinuousFunctionAlgebraClosed {X : Type u} [TopologicalSpace X]
    (C : ContinuousFunctionAlgebraPackage X) : Prop :=
  C.compact ∧ C.hausdorff ∧ BanachAlgebraClosed C.algebra

theorem continuous_function_algebra_closed_from_evidence {X : Type u} [TopologicalSpace X]
    (C : ContinuousFunctionAlgebraPackage X) (E : ContinuousFunctionAlgebraEvidence C) :
    ContinuousFunctionAlgebraClosed C := by
  exact And.intro E.compact_closed (And.intro E.hausdorff_closed E.algebra_closed)

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse