# Daniel Alberto Herrera-Rendon

**Senior Haskell & Nix Engineer · Reproducible Infrastructure · Programming Languages**

[hhefesto@rdataa.com](mailto:hhefesto@rdataa.com) · [hhefesto.com](https://hhefesto.com) · [GitHub](https://github.com/hhefesto) · [LinkedIn](https://www.linkedin.com/in/hhefesto/)

Denver, Colorado · Open to fully remote U.S. and international roles  
U.S. and Mexican citizen · No U.S. visa sponsorship required · Native English and Spanish

## Summary

Software engineer and independent consultant with over a decade of experience across fintech, scientific computing, and developer tooling. Specialize in production Haskell systems and reproducible infrastructure with Nix/NixOS, from backend development to CI/CD and deployment. Experience includes infrastructure modernization at FPComplete for Simspace, fintech services at Tontine Trust, and technical leadership of a scientific software platform. Combine hands-on engineering with programming-language development, independent research, and mentoring.

## Professional Experience

**CTO — RDATA S de RL MI · [xpsoasis.org](https://xpsoasis.org)**  
*2016–Present*

- Migrated XPSOasis from PHP to Haskell/Yesod; developing its Servant/Reflex successor with shared API types and desktop compatibility.
- Ported AAnalyzer to Linux and the web; developing Spectra2, a Haskell fitting engine with Agda specifications and numerical parity tests.
- Maintain NixOS infrastructure, automated deployments, PostgreSQL, and backups; trained more than five developers in Haskell.
- Collaborate with Los Alamos National Laboratory on AI-assisted X-ray photoelectron spectroscopy (XPS) fitting.

**Senior DevOps & Haskell Developer — Tontine Trust**  
*April–August 2025*

- Built and maintained a deploy-rs deployment pipeline across Rumble and OVH for development, staging, and production environments.
- Managed PostgreSQL migrations and Cachix build caching; integrated OVH Object Storage through Amazonka.
- Developed Haskell/Servant backend services and a Reflex FRP frontend connected to an internal LLM API.

**Senior Haskell Developer — FPComplete**  
*July 2022–May 2023*

- Held site reliability engineering responsibilities for client Simspace, maintaining and modernizing its Nix infrastructure.
- Introduced Nix flakes, updated haskell.nix, and configured Cachix binary caching.

**Software Engineering Intern — Microsoft · Redmond, Washington**  
*Summer 2016*

- Built an Excel add-in with a Scratch-inspired macro recorder, delivered as part of an internal productivity initiative.

**Co-Founder & Developer — Slice**  
*2015–2016*

- Designed and built a REST API in Clojure and configured production Linux servers with PostgreSQL, Tomcat, and nginx.

**Software Developer — Blue Messaging SA de CV**  
*July–November 2015*

- Implemented Java parsers for natural-language number conversion and date normalization to UTC.

**CTO & Innovation Coordinator — Red Wolf SA de CV**  
*August 2014–January 2015*

- Architected the backend API, database, and AWS EC2 hosting; designed and conducted technical interviews to grow the development team.

## Open-Source Development & Independent Research

**Core Language Developer — [Stand-In Language / Telomare](https://github.com/Stand-In-Language/stand-in-language)**  
*January 2020–Present*

- Develop Telomare's Haskell compiler, evaluators, and language server, using distinct syntax types to enforce compiler-stage boundaries.
- Accelerated the tic-tac-toe compilation benchmark from approximately 122 to 14 seconds (8.7×); prototyped static memory bounds for refinement-valid inputs, checked against measured heap usage.
- Maintain Nix builds, GitHub Actions CI, and Cachix caching; mentored two Haskell contributors.

**ana — Language Modeling, Formal Methods & GPU Training**  
*2025–Present* · [Code](https://github.com/hhefesto/ana)

- Developed an autoregressive language-modeling stack from Agda mathematical specifications through a Haskell reference implementation to Futhark GPU kernels; trained a 115-million-parameter hybrid gated linear/softmax attention model on Wikipedia and FineWeb-Edu using a single NVIDIA RTX 3090.
- Proved structural language, reverse-mode automatic differentiation, and decoding properties in Agda; built conformance checks comparing numerical outputs and gradients across reference and GPU implementations.
- Built a CUDA/cuBLAS training backend, incremental decoding, and resumable training pipelines with dataset and tokenizer identity checks; deployed prebuilt Nix closures to rented GPUs to eliminate compilation on paid GPU time.
- Investigated attention-gate behavior to guide architecture changes and corrected unstable recurrent-attention gradients, validating the fixes across Haskell, Futhark, and cuBLAS implementations.

## Technical Skills

- **Languages:** Haskell, Nix, PureScript, Agda, C/C++; additional experience with Clojure, Java, SQL, and PHP.
- **Functional web development:** Servant, Yesod, Reflex FRP, persistent/esqueleto, Amazonka.
- **Infrastructure & delivery:** NixOS, flakes, flake-parts, haskell.nix, deploy-rs, Cachix, GitHub Actions, nginx, agenix, home-manager.
- **Cloud platforms:** Hetzner, OVH, GCE, AWS; S3-compatible object storage.
- **Databases:** PostgreSQL, MySQL, Microsoft SQL Server.
- **Language implementation:** Parsec, Megaparsec, evaluators, annotated syntax trees, module systems, language-server tooling.

## Education

**Instituto Tecnológico Autónomo de México (ITAM) — Mexico City**

- Undergraduate studies in Computer Engineering, Applied Mathematics and Economics.

## Selected Honors & Community

- Third place, Concurso Interuniversitario Iberoamericano de Matemáticas, 2013.
- Honorable mention, Mexican National Mathematics Olympiad (OMM); first place, Querétaro State High-School Mathematics Olympiad.
- Competed in three ACM-ICPC regional rounds.
- Invited speaker, Proof-of-Work seminar, mathematics department, Universidad Autónoma de Querétaro.
