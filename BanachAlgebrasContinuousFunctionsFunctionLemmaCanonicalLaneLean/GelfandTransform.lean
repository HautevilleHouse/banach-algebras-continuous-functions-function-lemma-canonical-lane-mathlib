import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean.ContinuousFunctionAlgebra

namespace HautevilleHouse
namespace BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean

structure GelfandTransformPackage {X : Type u} [TopologicalSpace X]
    (C : ContinuousFunctionAlgebraPackage X) where
  maximal_ideal_space : Type u
  maximal_ideal_topology : TopologicalSpace maximal_ideal_space
  gelfand_map : C.algebra.carrier → (maximal_ideal_space → ℝ)
  isometric : ∀ f : C.algebra.carrier, C.algebra.norm f = (Set.range fun (φ : maximal_ideal_space) => |gelfand_map f φ|).sup' (by
    have : CompactSpace maximal_ideal_space := by
      have : CompactSpace X := C.compact
      exact this
    exact this
  )
  surjective_onto_continuous : Function.Surjective gelfand_map

structure GelfandTransformEvidence {X : Type u} [TopologicalSpace X]
    {C : ContinuousFunctionAlgebraPackage X} (G : GelfandTransformPackage C) where
  isometric_closed : ∀ f : C.algebra.carrier, C.algebra.norm f = (Set.range fun (φ : G.maximal_ideal_space) => |G.gelfand_map f φ|).sup' (by
    have : CompactSpace G.maximal_ideal_space := by
      have : CompactSpace X := C.compact
      exact this
    exact this
  )
  surjective_closed : Function.Surjective G.gelfand_map

def GelfandTransformClosed {X : Type u} [TopologicalSpace X]
    {C : ContinuousFunctionAlgebraPackage X} (G : GelfandTransformPackage C) : Prop :=
  (∀ f : C.algebra.carrier, C.algebra.norm f = (Set.range fun (φ : G.maximal_ideal_space) => |G.gelfand_map f φ|).sup' (by
    have : CompactSpace G.maximal_ideal_space := by
      have : CompactSpace X := C.compact
      exact this
    exact this
  )) ∧ Function.Surjective G.gelfand_map

theorem gelfand_transform_closed_from_evidence {X : Type u} [TopologicalSpace X]
    {C : ContinuousFunctionAlgebraPackage X} (G : GelfandTransformPackage C)
    (E : GelfandTransformEvidence G) : GelfandTransformClosed G := by
  exact And.intro E.isometric_closed E.surjective_closed

end BanachAlgebrasContinuousFunctionsFunctionLemmaCanonicalLaneLean
end HautevilleHouse