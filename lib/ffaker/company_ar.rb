# encoding: utf-8
# => author: Pablo Vizcay github.com/vizcay

module Faker
  module CompanyAR
    extend ModuleUtils
    extend self

    def name
      case rand(4)
      when 0 then "#{NameAR.full_name} #{suffix}"
      when 1 then "#{NameAR.last_name} e Hijos #{suffix}"
      when 2 then "#{NameAR.last_name} & #{NameAR.last_name} #{suffix}"
      when 3 then "#{NameAR.full_name}"
      end
    end

    def suffix
      SUFFIXES.rand
    end

    # Generate a buzzword-laden catch phrase.
    # Wordlist from http://www.1728.com/buzzword.htm
    def catch_phrase
      "#{CATCH_PRE.rand} #{CATCH_MID.rand} #{CATCH_POS.rand}"
    end

    # When a straight answer won't do, BS to the rescue!
    # Wordlist from http://dack.com/web/bullshit.html
    def bs
      "#{BS_PRE.rand} #{BS_MID.rand} #{BS_POS.rand}"
    end

    def position
      case rand(3)
        when 0 then [POSITION_PREFIXES.rand, POSITIONS.rand]
        when 1 then [POSITION_AREAS.rand, POSITIONS.rand]
        when 2 then [POSITION_PREFIXES.rand, POSITION_AREAS.rand, POSITIONS.rand]
      end.join(' ')
    end

    SUFFIXES = k %w(S.R.L S.A. Coop.)

    CATCH_PRE = k ["Adaptable", "Avanzado", "Asimilado", "Arquitecturizado", "Automatizado", "Actualizable",
      "Balanceado",
      "Centrado-negocio", "Centralizado", "Clonado",
      "Compatible", "Configurable", "Contextualizado",
      "Centrado", "Centrado-calidad",
      "Decentralizado","Digitalizado", "Distribuido", "Diverso",
      "Ergonomico", "Exclusivo", "Expandido",
      "Extendido", "Estandarizado",
      "Funcionable", "Fundamental",
      "Horizontal",
      "Implementado", "Innovador", "Integrado", "Intuitivo", "Inverso", "Independiente",
      "Manejable", "Monitoreado",
      "Mejorado", "Multi-canal", "Multi-lateral", "Multi-capa",
      "Open-source", "Obligatorio", "Operativo", "Optimizado", "Opcional", "Orgánico", "Organizado", "Orientado",
      "Parametrizable", "Perseverante", "Persistente", "Polarizado",
      "Pro-activo", "Profundo", "Programable", "Progresivo",
      "Reactivo", "Realineado", "Reducido", "Robusto",
      "Total",
      "Universal",
      "Versatil", "Virtual", "Visionario"]

    CATCH_MID = k ["24hrs", "24/7", "2da generación", "3ra generación",
      "actuating", "analyzing", "assymetric",
      "asynchronous", "attitude-oriented", "background", "bandwidth-monitored",
      "bi-directional", "bifurcated", "bottom-line", "clear-thinking",
      "client-driven", "client-server", "coherent", "cohesive", "composite",
      "context-sensitive", "contextually-based", "content-based", "dedicated",
      "demand-driven", "didactic", "directional", "discrete", "disintermediate",
      "dynamic", "eco-centric", "empowering", "encompassing", "even-keeled",
      "executive", "explicit", "exuding", "fault-tolerant", "foreground",
      "fresh-thinking", "full-range", "global", "grid-enabled", "heuristic",
      "high-level", "holistic", "homogeneous", "human-resource", "hybrid",
      "impactful", "incremental", "intangible", "interactive", "intermediate",
      "leading edge", "local", "logistical", "maximized", "methodical",
      "mission-critical", "mobile", "modular", "motivating", "multimedia",
      "multi-state", "multi-tasking", "national", "needs-based", "neutral",
      "next generation", "non-volatile", "object-oriented", "optimal", "optimizing",
      "radical", "real-time", "reciprocal", "regional", "responsive", "scalable",
      "secondary", "solution-oriented", "stable", "static", "systematic",
      "systemic", "system-worthy", "tangible", "tertiary", "transitional",
      "uniform", "upward-trending", "user-facing", "value-added", "web-enabled",
      "well-modulated", "zero administration", "zero defect", "zero tolerance"]

    CATCH_POS = k ["ability", "access", "adapter", "algorithm", "alliance",
      "analyzer", "application", "approach", "architecture", "archive",
      "artificial intelligence", "array", "attitude", "benchmark",
      "budgetary management", "capability", "capacity", "challenge", "circuit",
      "collaboration", "complexity", "concept", "conglomeration",
      "contingency", "core", "customer loyalty", "database",
      "data-warehouse", "definition", "emulation", "encoding", "encryption",
      "extranet", "firmware", "flexibility", "focus group", "forecast",
      "frame", "framework", "function", "functionalities", "Graphic Interface",
      "groupware", "Graphical User Interface", "hardware",
      "help-desk", "hierarchy", "hub", "implementation", "info-mediaries",
      "infrastructure", "initiative", "installation", "instruction set",
      "interface", "internet solution", "intranet", "knowledge user",
      "knowledge base", "local area network", "leverage", "matrices",
      "matrix", "methodology", "middleware", "migration", "model",
      "moderator", "monitoring", "moratorium", "neural-net", "open architecture",
      "open system", "orchestration", "paradigm", "parallelism", "policy",
      "portal", "pricing structure", "process improvement", "product",
      "productivity", "project", "projection", "protocol", "secured line",
      "service-desk", "software", "solution", "standardization",
      "strategy", "structure", "success", "superstructure", "support",
      "synergy", "system engine", "task-force", "throughput",
      "time-frame", "toolset", "utilisation", "website",
      "workforce"]

    BS_PRE = k ["implement", "utilize", "integrate", "streamline", "optimize",
      "evolve", "transform", "embrace", "enable", "orchestrate", "leverage",
      "reinvent", "aggregate", "architect", "enhance", "incentivize",
      "morph", "empower", "envisioneer", "monetize", "harness", "facilitate",
      "seize", "disintermediate", "synergize", "strategize", "deploy",
      "brand", "grow", "target", "syndicate", "synthesize", "deliver",
      "mesh", "incubate", "engage", "maximize", "benchmark", "expedite",
      "reintermediate", "whiteboard", "visualize", "repurpose", "innovate",
      "scale", "unleash", "drive", "extend", "engineer", "revolutionize",
      "generate", "exploit", "transition", "e-enable", "iterate",
      "cultivate", "matrix", "productize", "redefine", "recontextualize"]

    BS_MID = k ["clicks-and-mortar", "value-added", "vertical", "proactive",
      "robust", "revolutionary", "scalable", "leading-edge", "innovative",
      "intuitive", "strategic", "e-business", "mission-critical", "sticky",
      "one-to-one", "24/7", "end-to-end", "global", "B2B", "B2C", "granular",
      "frictionless", "virtual", "viral", "dynamic", "24/365",
      "best-of-breed", "killer", "magnetic", "bleeding-edge", "web-enabled",
      "interactive", "dot-com", "sexy", "back-end", "real-time", "efficient",
      "front-end", "distributed", "seamless", "extensible", "turn-key",
      "world-class", "open-source", "cross-platform", "cross-media",
      "synergistic", "bricks-and-clicks", "out-of-the-box", "enterprise",
      "integrated", "impactful", "wireless", "transparent",
      "next-generation", "cutting-edge", "user-centric", "visionary",
      "customized", "ubiquitous", "plug-and-play", "collaborative",
      "compelling", "holistic", "rich"]

    BS_POS = k ["synergies", "web-readiness", "paradigms", "markets",
      "partnerships", "infrastructures", "platforms", "initiatives",
      "channels", "eyeballs", "communities", "ROI", "solutions", "e-tailers",
      "e-services", "action-items", "portals", "niches", "technologies",
      "content", "vortals", "supply-chains", "convergence", "relationships",
      "architectures", "interfaces", "e-markets", "e-commerce", "systems",
      "bandwidth", "infomediaries", "models", "mindshare", "deliverables",
      "users", "schemas", "networks", "applications", "metrics",
      "e-business", "functionalities", "experiences", "web services",
      "methodologies"]

    POSITION_PREFIXES = k %w[Executive Assistant General Associate]
    POSITION_AREAS = k %w[Finance IT Operations Information Vice Sales Marketing Corporate Department Regional Division]
    POSITIONS = k %w[President Manager Director Secretary Consultant]
  end
end
