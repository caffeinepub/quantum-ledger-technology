import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import {
  Table,
  TableBody,
  TableCell,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { Textarea } from "@/components/ui/textarea";
import {
  AlertCircle,
  ArrowRight,
  Building,
  CheckCircle,
  ChevronRight,
  Cpu,
  Download,
  Globe,
  Linkedin,
  Lock,
  Mail,
  Menu,
  Network,
  Send,
  Shield,
  TrendingUp,
  Twitter,
  Users,
  Wallet,
  X,
  XCircle,
  Zap,
} from "lucide-react";
import { useCallback, useEffect, useRef, useState } from "react";
import { useActor } from "./hooks/useActor";

// ─── Canvas Particle Network ────────────────────────────────────────────────
interface Particle {
  x: number;
  y: number;
  vx: number;
  vy: number;
  size: number;
  color: string;
  alpha: number;
}

function QuantumCanvas() {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const animFrameRef = useRef<number>(0);
  const particlesRef = useRef<Particle[]>([]);

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    const resize = () => {
      canvas.width = canvas.offsetWidth;
      canvas.height = canvas.offsetHeight;
    };
    resize();
    window.addEventListener("resize", resize);

    const colors = ["#0ea5e9", "#38bdf8", "#a855f7", "#c084fc", "#00f5ff"];
    const count = Math.min(
      80,
      Math.floor((canvas.width * canvas.height) / 12000),
    );

    particlesRef.current = Array.from({ length: count }, () => ({
      x: Math.random() * canvas.width,
      y: Math.random() * canvas.height,
      vx: (Math.random() - 0.5) * 0.4,
      vy: (Math.random() - 0.5) * 0.4,
      size: Math.random() * 2 + 1,
      color: colors[Math.floor(Math.random() * colors.length)],
      alpha: Math.random() * 0.6 + 0.2,
    }));

    const draw = () => {
      ctx.clearRect(0, 0, canvas.width, canvas.height);
      const pts = particlesRef.current;

      // Draw connections
      for (let i = 0; i < pts.length; i++) {
        for (let j = i + 1; j < pts.length; j++) {
          const dx = pts[i].x - pts[j].x;
          const dy = pts[i].y - pts[j].y;
          const dist = Math.sqrt(dx * dx + dy * dy);
          if (dist < 140) {
            const alpha = (1 - dist / 140) * 0.25;
            ctx.beginPath();
            ctx.moveTo(pts[i].x, pts[i].y);
            ctx.lineTo(pts[j].x, pts[j].y);
            ctx.strokeStyle = `rgba(14, 165, 233, ${alpha})`;
            ctx.lineWidth = 0.8;
            ctx.stroke();
          }
        }
      }

      // Draw particles
      for (const p of pts) {
        ctx.beginPath();
        ctx.arc(p.x, p.y, p.size, 0, Math.PI * 2);
        ctx.fillStyle = p.color;
        ctx.globalAlpha = p.alpha;
        ctx.fill();
        ctx.globalAlpha = 1;

        // Glow
        ctx.beginPath();
        ctx.arc(p.x, p.y, p.size * 3, 0, Math.PI * 2);
        const grad = ctx.createRadialGradient(
          p.x,
          p.y,
          0,
          p.x,
          p.y,
          p.size * 3,
        );
        grad.addColorStop(
          0,
          p.color
            .replace(")", ", 0.15)")
            .replace("#", "rgba(")
            .replace(
              /^rgba\(([0-9a-f]{2})([0-9a-f]{2})([0-9a-f]{2})/,
              (_m, r, g, b) =>
                `rgba(${Number.parseInt(r, 16)}, ${Number.parseInt(g, 16)}, ${Number.parseInt(b, 16)}`,
            ),
        );
        grad.addColorStop(1, "rgba(0,0,0,0)");
        ctx.fillStyle = grad;
        ctx.fill();

        // Move
        p.x += p.vx;
        p.y += p.vy;
        if (p.x < 0) p.x = canvas.width;
        if (p.x > canvas.width) p.x = 0;
        if (p.y < 0) p.y = canvas.height;
        if (p.y > canvas.height) p.y = 0;
      }

      animFrameRef.current = requestAnimationFrame(draw);
    };

    draw();
    return () => {
      cancelAnimationFrame(animFrameRef.current);
      window.removeEventListener("resize", resize);
    };
  }, []);

  return <canvas ref={canvasRef} id="quantum-canvas" />;
}

// ─── Scroll Animation Hook ────────────────────────────────────────────────────
function useScrollReveal() {
  useEffect(() => {
    const elements = document.querySelectorAll(".fade-in-up, .fade-in");
    const observer = new IntersectionObserver(
      (entries) => {
        for (const entry of entries) {
          if (entry.isIntersecting) {
            entry.target.classList.add("visible");
          }
        }
      },
      { threshold: 0.1, rootMargin: "0px 0px -40px 0px" },
    );
    for (const el of elements) {
      observer.observe(el);
    }
    return () => observer.disconnect();
  }, []);
}

// ─── Stat Card ────────────────────────────────────────────────────────────────
function StatCard({
  value,
  label,
  sublabel,
  color = "blue",
  index = 0,
}: {
  value: string;
  label: string;
  sublabel: string;
  color?: "blue" | "purple" | "red" | "orange";
  index?: number;
}) {
  const colorMap = {
    blue: "rgba(14, 165, 233, 0.15)",
    purple: "rgba(168, 85, 247, 0.15)",
    red: "rgba(239, 68, 68, 0.15)",
    orange: "rgba(249, 115, 22, 0.15)",
  };
  const borderMap = {
    blue: "rgba(14, 165, 233, 0.3)",
    purple: "rgba(168, 85, 247, 0.3)",
    red: "rgba(239, 68, 68, 0.4)",
    orange: "rgba(249, 115, 22, 0.4)",
  };
  const textMap = {
    blue: "#38bdf8",
    purple: "#c084fc",
    red: "#f87171",
    orange: "#fb923c",
  };

  return (
    <div
      className="fade-in-up rounded-xl p-6 text-center"
      style={{
        transitionDelay: `${index * 0.1}s`,
        background: colorMap[color],
        border: `1px solid ${borderMap[color]}`,
      }}
    >
      <div
        className="text-4xl font-display font-bold mb-2"
        style={{ color: textMap[color] }}
      >
        {value}
      </div>
      <div className="text-white font-semibold text-lg">{label}</div>
      <div className="text-gray-400 text-sm mt-1">{sublabel}</div>
    </div>
  );
}

// ─── Team Member ─────────────────────────────────────────────────────────────
function TeamCard({
  name,
  title,
  bio,
  initials,
  gradient,
  index = 0,
}: {
  name: string;
  title: string;
  bio: string;
  initials: string;
  gradient: string;
  index?: number;
}) {
  return (
    <div
      className="fade-in-up glass-card rounded-xl p-6 text-center hover:border-blue-500/30 transition-all duration-300 group"
      style={{ transitionDelay: `${index * 0.08}s` }}
    >
      <div
        className="w-20 h-20 rounded-full mx-auto mb-4 flex items-center justify-center text-white text-2xl font-bold group-hover:scale-105 transition-transform"
        style={{ background: gradient }}
      >
        {initials}
      </div>
      <h3 className="text-white font-semibold text-lg">{name}</h3>
      <div className="text-qblue text-sm font-medium mt-1 mb-3">{title}</div>
      <p className="text-gray-400 text-sm leading-relaxed">{bio}</p>
    </div>
  );
}

// ─── Main App ─────────────────────────────────────────────────────────────────
export default function App() {
  const { actor } = useActor();
  const [mobileOpen, setMobileOpen] = useState(false);
  const [activeSection, setActiveSection] = useState("hero");
  const [formData, setFormData] = useState({
    name: "",
    email: "",
    company: "",
    interestLevel: "",
  });
  const [formState, setFormState] = useState<
    "idle" | "loading" | "success" | "error"
  >("idle");
  const [errorMsg, setErrorMsg] = useState("");
  const [textarea, setTextarea] = useState("");

  useScrollReveal();

  const scrollTo = useCallback((id: string) => {
    document.getElementById(id)?.scrollIntoView({ behavior: "smooth" });
    setMobileOpen(false);
  }, []);

  useEffect(() => {
    const sections = [
      "hero",
      "problem",
      "solution",
      "howitworks",
      "roadmap",
      "market",
      "businessmodel",
      "competitive",
      "team",
      "investment",
      "contact",
    ];
    const observer = new IntersectionObserver(
      (entries) => {
        for (const e of entries) {
          if (e.isIntersecting) setActiveSection(e.target.id);
        }
      },
      { threshold: 0.4 },
    );
    for (const s of sections) {
      const el = document.getElementById(s);
      if (el) observer.observe(el);
    }
    return () => observer.disconnect();
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (
      !formData.name ||
      !formData.email ||
      !formData.company ||
      !formData.interestLevel
    ) {
      setErrorMsg("Please fill in all fields.");
      setFormState("error");
      return;
    }
    setFormState("loading");
    try {
      if (!actor) throw new Error("Not connected");
      await actor.submitLead(
        formData.name,
        formData.email,
        formData.company,
        formData.interestLevel,
      );
      setFormState("success");
    } catch {
      setErrorMsg("Something went wrong. Please try again.");
      setFormState("error");
    }
  };

  const navLinks = [
    { id: "solution", label: "Technology" },
    { id: "howitworks", label: "How It Works" },
    { id: "roadmap", label: "Roadmap" },
    { id: "market", label: "Market" },
    { id: "team", label: "Team" },
    { id: "investment", label: "Invest" },
  ];

  return (
    <div
      className="min-h-screen bg-black text-white"
      style={{ fontFamily: "'Sora', system-ui, sans-serif" }}
    >
      {/* ── Navigation ─────────────────────────────────────────── */}
      <nav className="fixed top-0 left-0 right-0 z-50 nav-blur">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center justify-between h-16">
            {/* Logo */}
            <button
              type="button"
              onClick={() => scrollTo("hero")}
              className="flex items-center gap-2 group"
              data-ocid="nav.link"
            >
              <img
                src="/assets/generated/qlt-logo-transparent.dim_400x400.png"
                alt="QLT Logo"
                className="w-8 h-8 object-contain"
              />
              <span className="font-display font-bold text-xl gradient-text">
                QLT
              </span>
            </button>

            {/* Desktop Nav */}
            <div className="hidden md:flex items-center gap-6">
              {navLinks.map((link) => (
                <button
                  key={link.id}
                  type="button"
                  onClick={() => scrollTo(link.id)}
                  data-ocid="nav.link"
                  className={`text-sm transition-colors ${
                    activeSection === link.id
                      ? "text-qblue font-medium"
                      : "text-gray-300 hover:text-white"
                  }`}
                >
                  {link.label}
                </button>
              ))}
              <Button
                onClick={() => scrollTo("investment")}
                data-ocid="nav.primary_button"
                className="text-sm px-4 py-2 rounded-lg font-medium"
                style={{
                  background: "linear-gradient(135deg, #0ea5e9, #7c3aed)",
                  border: "none",
                  color: "white",
                }}
              >
                Investor Deck
              </Button>
            </div>

            {/* Mobile Toggle */}
            <button
              type="button"
              className="md:hidden text-white p-2"
              onClick={() => setMobileOpen(!mobileOpen)}
              data-ocid="nav.toggle"
            >
              {mobileOpen ? <X size={20} /> : <Menu size={20} />}
            </button>
          </div>
        </div>

        {/* Mobile Menu */}
        {mobileOpen && (
          <div className="md:hidden bg-black/95 border-t border-white/10 px-4 py-4 space-y-3">
            {navLinks.map((link) => (
              <button
                type="button"
                key={link.id}
                onClick={() => scrollTo(link.id)}
                data-ocid="nav.link"
                className="block w-full text-left text-gray-300 hover:text-white py-2"
              >
                {link.label}
              </button>
            ))}
            <Button
              onClick={() => scrollTo("investment")}
              data-ocid="nav.primary_button"
              className="w-full"
              style={{
                background: "linear-gradient(135deg, #0ea5e9, #7c3aed)",
                border: "none",
                color: "white",
              }}
            >
              Investor Deck
            </Button>
          </div>
        )}
      </nav>

      {/* ── Hero ──────────────────────────────────────────────────── */}
      <section
        id="hero"
        data-ocid="hero.section"
        className="relative min-h-screen flex items-center justify-center overflow-hidden"
        style={{ paddingTop: "64px" }}
      >
        {/* Background image */}
        <div
          className="absolute inset-0 z-0"
          style={{
            backgroundImage:
              "url('/assets/generated/hero-network.dim_1920x1080.jpg')",
            backgroundSize: "cover",
            backgroundPosition: "center",
            opacity: 0.25,
          }}
        />
        {/* Canvas */}
        <QuantumCanvas />
        {/* Overlay gradient */}
        <div
          className="absolute inset-0 z-[2]"
          style={{
            background:
              "radial-gradient(ellipse at center, rgba(14,165,233,0.08) 0%, rgba(0,0,0,0.7) 70%)",
          }}
        />
        {/* Quantum grid */}
        <div className="absolute inset-0 z-[2] quantum-grid" />

        {/* Content */}
        <div className="relative z-[3] max-w-5xl mx-auto px-4 text-center">
          <div className="inline-flex items-center gap-2 mb-6 px-4 py-2 rounded-full glass-card-blue text-qblue text-sm font-medium fade-in">
            <Zap size={14} />
            Quantum-Resilient Cybersecurity Architecture
          </div>

          <h1
            className="font-display text-5xl sm:text-6xl lg:text-7xl font-bold leading-tight mb-6 fade-in-up"
            style={{ transitionDelay: "0.1s" }}
          >
            Quantum-Safe Infrastructure
            <br />
            <span className="gradient-text">for the Future of Finance</span>
          </h1>

          <p
            className="text-lg sm:text-xl text-gray-300 max-w-3xl mx-auto mb-10 leading-relaxed fade-in-up"
            style={{ transitionDelay: "0.2s" }}
          >
            QLT is a quantum-resilient cybersecurity architecture designed to
            protect blockchain, DeFi, and Web3 systems from both classical and
            quantum attacks.
          </p>

          <div
            className="flex flex-col sm:flex-row gap-4 justify-center fade-in-up"
            style={{ transitionDelay: "0.3s" }}
          >
            <Button
              onClick={() => scrollTo("solution")}
              data-ocid="hero.primary_button"
              size="lg"
              className="px-8 py-3 rounded-lg font-semibold text-base"
              style={{
                background: "linear-gradient(135deg, #0ea5e9, #0284c7)",
                border: "none",
                color: "white",
                boxShadow: "0 0 30px rgba(14,165,233,0.4)",
              }}
            >
              View Technology <ChevronRight size={16} />
            </Button>
            <Button
              onClick={() => scrollTo("investment")}
              data-ocid="hero.secondary_button"
              size="lg"
              variant="outline"
              className="px-8 py-3 rounded-lg font-semibold text-base"
              style={{
                borderColor: "rgba(14,165,233,0.5)",
                color: "#38bdf8",
                background: "transparent",
              }}
            >
              Investor Deck
            </Button>
            <Button
              onClick={() => scrollTo("contact")}
              data-ocid="hero.secondary_button"
              size="lg"
              variant="outline"
              className="px-8 py-3 rounded-lg font-semibold text-base"
              style={{
                borderColor: "rgba(168,85,247,0.5)",
                color: "#c084fc",
                background: "transparent",
              }}
            >
              Contact for Seed Investment
            </Button>
          </div>

          {/* Scroll indicator */}
          <div
            className="absolute bottom-8 left-1/2 -translate-x-1/2 fade-in"
            style={{ transitionDelay: "0.8s" }}
          >
            <div className="w-6 h-10 rounded-full border-2 border-white/20 flex items-start justify-center p-1">
              <div className="w-1 h-2 bg-qblue rounded-full animate-bounce" />
            </div>
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── Problem ───────────────────────────────────────────────── */}
      <section
        id="problem"
        data-ocid="problem.section"
        className="py-24 relative overflow-hidden"
        style={{
          background:
            "radial-gradient(ellipse at 50% 0%, rgba(239, 68, 68, 0.08) 0%, transparent 70%), #000",
        }}
      >
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16">
            <div
              className="inline-flex items-center gap-2 mb-4 px-4 py-2 rounded-full text-sm"
              style={{
                background: "rgba(239,68,68,0.1)",
                border: "1px solid rgba(239,68,68,0.2)",
                color: "#f87171",
              }}
            >
              <AlertCircle size={14} /> Critical Threat
            </div>
            <h2 className="font-display text-4xl sm:text-5xl font-bold text-white fade-in-up">
              The Security Crisis of the{" "}
              <span style={{ color: "#f87171" }}>Crypto Economy</span>
            </h2>
            <p
              className="text-gray-400 text-lg mt-4 max-w-2xl mx-auto fade-in-up"
              style={{ transitionDelay: "0.1s" }}
            >
              Current blockchain infrastructure is built on cryptographic
              foundations that are already vulnerable — and will be
              catastrophically broken within this decade.
            </p>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 mb-16">
            <StatCard
              value="$3T+"
              label="Global Crypto Economy"
              sublabel="And growing rapidly"
              color="blue"
              index={0}
            />
            <StatCard
              value="$4.3B+"
              label="Lost to Hacks"
              sublabel="In 2023 alone"
              color="red"
              index={1}
            />
            <StatCard
              value="95%"
              label="Vulnerable Wallets"
              sublabel="To user-facing attacks"
              color="orange"
              index={2}
            />
            <StatCard
              value="2030"
              label="Quantum Deadline"
              sublabel="When current encryption breaks"
              color="purple"
              index={3}
            />
          </div>

          <div className="grid md:grid-cols-3 gap-6">
            {[
              {
                icon: <Lock className="text-red-400" size={24} />,
                title: "Broken Foundations",
                desc: "ECDSA and RSA cryptography, the backbone of all blockchain systems, are mathematically solvable by quantum computers running Shor's algorithm.",
              },
              {
                icon: <AlertCircle className="text-orange-400" size={24} />,
                title: "Software Attack Surfaces",
                desc: "Every smart contract, wallet interface, and exchange is a software target. Code vulnerabilities, supply chain attacks, and zero-days plague the ecosystem.",
              },
              {
                icon: <Network className="text-yellow-400" size={24} />,
                title: "No Quantum Migration Path",
                desc: "No existing blockchain infrastructure has a credible migration path to quantum-safe cryptography. The industry is sleepwalking into catastrophe.",
              },
            ].map((item, i) => (
              <div
                key={item.title}
                className="fade-in-up glass-card rounded-xl p-6"
                style={{ transitionDelay: `${i * 0.1}s` }}
              >
                <div className="mb-3">{item.icon}</div>
                <h3 className="text-white font-semibold text-lg mb-2">
                  {item.title}
                </h3>
                <p className="text-gray-400 text-sm leading-relaxed">
                  {item.desc}
                </p>
              </div>
            ))}
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── Solution ──────────────────────────────────────────────── */}
      <section
        id="solution"
        data-ocid="solution.section"
        className="py-24 relative"
        style={{
          background:
            "radial-gradient(ellipse at 50% 100%, rgba(14,165,233,0.06) 0%, transparent 60%), #000",
        }}
      >
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16">
            <div className="inline-flex items-center gap-2 mb-4 px-4 py-2 rounded-full glass-card-blue text-qblue text-sm">
              <Shield size={14} /> The Solution
            </div>
            <h2 className="font-display text-4xl sm:text-5xl font-bold text-white fade-in-up">
              Introducing{" "}
              <span className="gradient-text">Quantum Ledger Technology</span>
            </h2>
            <p
              className="text-gray-400 text-lg mt-4 max-w-2xl mx-auto fade-in-up"
              style={{ transitionDelay: "0.1s" }}
            >
              A blockchain-agnostic architecture built for the quantum era —
              eliminating attack surfaces at the hardware level.
            </p>
          </div>

          {/* Feature Cards */}
          <div className="grid md:grid-cols-3 gap-6 mb-16">
            {[
              {
                icon: <Cpu size={28} />,
                title: "Zero Vulnerability Computing",
                abbr: "ZVC",
                desc: "Eliminates exploitable software surfaces by running all critical logic in hardware-isolated environments. No software = no software attack.",
                color: "#0ea5e9",
                bg: "rgba(14,165,233,0.08)",
                border: "rgba(14,165,233,0.25)",
              },
              {
                icon: <Shield size={28} />,
                title: "Solid-State Software on a Chip",
                abbr: "3SoC",
                desc: "Immutable firmware cryptographic core burned into silicon. Immune to software-layer attacks, supply chain compromises, and zero-day exploits.",
                color: "#a855f7",
                bg: "rgba(168,85,247,0.08)",
                border: "rgba(168,85,247,0.25)",
              },
              {
                icon: <Lock size={28} />,
                title: "QRUECA Authentication",
                abbr: "QRUECA",
                desc: "User-evasive cryptography: the first handshake is Device-Device using QCC (QRUECA Crypto Certificate). The second handshake excludes all non-QLT nodes — making QLT super light, economical, fast, and energy-efficient compared to PQC.",
                color: "#00f5ff",
                bg: "rgba(0,245,255,0.06)",
                border: "rgba(0,245,255,0.2)",
              },
            ].map((card, i) => (
              <div
                key={card.title}
                className="fade-in-up rounded-xl p-6 group hover:scale-[1.02] transition-all duration-300"
                style={{
                  background: card.bg,
                  border: `1px solid ${card.border}`,
                  transitionDelay: `${i * 0.1}s`,
                }}
              >
                <div
                  className="w-12 h-12 rounded-lg flex items-center justify-center mb-4"
                  style={{
                    background: card.bg,
                    border: `1px solid ${card.border}`,
                    color: card.color,
                  }}
                >
                  {card.icon}
                </div>
                <div
                  className="inline-block px-2 py-1 rounded text-xs font-mono font-bold mb-3"
                  style={{
                    background: card.bg,
                    color: card.color,
                    border: `1px solid ${card.border}`,
                  }}
                >
                  {card.abbr}
                </div>
                <h3 className="text-white font-semibold text-xl mb-3">
                  {card.title}
                </h3>
                <p className="text-gray-400 text-sm leading-relaxed">
                  {card.desc}
                </p>
              </div>
            ))}
          </div>

          {/* Architecture Diagram */}
          <div className="fade-in-up max-w-2xl mx-auto">
            <h3 className="text-center text-gray-400 text-sm font-medium mb-8 uppercase tracking-widest">
              QLT Architecture
            </h3>
            <div
              className="relative flex items-center justify-center"
              style={{ height: "280px" }}
            >
              {/* Center node */}
              <div
                className="absolute z-10 w-20 h-20 rounded-full flex items-center justify-center text-center text-xs font-bold pulse-glow"
                style={{
                  background: "linear-gradient(135deg, #0ea5e9, #7c3aed)",
                  color: "white",
                  fontSize: "10px",
                }}
              >
                QLT
                <br />
                CORE
              </div>
              {/* Connecting lines */}
              <svg
                aria-hidden="true"
                className="absolute inset-0"
                width="100%"
                height="100%"
                style={{ overflow: "visible" }}
              >
                <defs>
                  <filter id="glow">
                    <feGaussianBlur stdDeviation="3" result="coloredBlur" />
                    <feMerge>
                      <feMergeNode in="coloredBlur" />
                      <feMergeNode in="SourceGraphic" />
                    </feMerge>
                  </filter>
                </defs>
                <line
                  x1="50%"
                  y1="50%"
                  x2="50%"
                  y2="10%"
                  stroke="#0ea5e9"
                  strokeWidth="1.5"
                  strokeDasharray="4,4"
                  filter="url(#glow)"
                />
                <line
                  x1="50%"
                  y1="50%"
                  x2="15%"
                  y2="85%"
                  stroke="#a855f7"
                  strokeWidth="1.5"
                  strokeDasharray="4,4"
                  filter="url(#glow)"
                />
                <line
                  x1="50%"
                  y1="50%"
                  x2="85%"
                  y2="85%"
                  stroke="#00f5ff"
                  strokeWidth="1.5"
                  strokeDasharray="4,4"
                  filter="url(#glow)"
                />
              </svg>
              {/* ZVC */}
              <div
                className="absolute top-0 left-1/2 -translate-x-1/2 w-24 h-24 hexagon flex items-center justify-center text-center text-xs font-bold"
                style={{
                  background: "rgba(14,165,233,0.15)",
                  border: "2px solid rgba(14,165,233,0.4)",
                  color: "#38bdf8",
                  fontSize: "11px",
                }}
              >
                ZVC
              </div>
              {/* 3SoC */}
              <div
                className="absolute bottom-0 left-4 w-24 h-24 hexagon flex items-center justify-center text-center text-xs font-bold"
                style={{
                  background: "rgba(168,85,247,0.15)",
                  border: "2px solid rgba(168,85,247,0.4)",
                  color: "#c084fc",
                  fontSize: "11px",
                }}
              >
                3SoC
              </div>
              {/* QRUECA */}
              <div
                className="absolute bottom-0 right-4 w-24 h-24 hexagon flex items-center justify-center text-center text-xs font-bold"
                style={{
                  background: "rgba(0,245,255,0.08)",
                  border: "2px solid rgba(0,245,255,0.3)",
                  color: "#00f5ff",
                  fontSize: "10px",
                }}
              >
                QRUECA
              </div>
            </div>
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── How It Works ──────────────────────────────────────────── */}
      <section
        id="howitworks"
        data-ocid="howitworks.section"
        className="py-24"
        style={{ background: "#000" }}
      >
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="font-display text-4xl sm:text-5xl font-bold text-white fade-in-up">
              How <span className="gradient-text">QLT Works</span>
            </h2>
            <p
              className="text-gray-400 text-lg mt-4 max-w-xl mx-auto fade-in-up"
              style={{ transitionDelay: "0.1s" }}
            >
              A four-layer quantum-safe security architecture that eliminates
              attack surfaces end-to-end.
            </p>
          </div>

          {/* Steps — horizontal on desktop */}
          <div className="relative">
            {/* Connector line (desktop) */}
            <div
              className="hidden lg:block absolute top-16 left-0 right-0 h-0.5 z-0"
              style={{
                background:
                  "linear-gradient(to right, #0ea5e9, #a855f7, #0ea5e9)",
              }}
            />

            <div className="grid grid-cols-1 lg:grid-cols-4 gap-8 relative z-10">
              {[
                {
                  step: "01",
                  title: "Device Authentication",
                  desc: "QRUECA handshake between endpoints establishes a quantum-resistant identity for every device on the network.",
                  icon: <Users size={20} />,
                  color: "#0ea5e9",
                },
                {
                  step: "02",
                  title: "QLT Tunnel",
                  desc: "Encrypted quantum-resistant communication channel wraps all data in lattice-based cryptography — unbreakable even with quantum computers.",
                  icon: <Network size={20} />,
                  color: "#38bdf8",
                },
                {
                  step: "03",
                  title: "Secure Server Nodes",
                  desc: "3SoC-protected node infrastructure ensures server-side integrity. Hardware-burned firmware eliminates software exploitation vectors.",
                  icon: <Cpu size={20} />,
                  color: "#a855f7",
                },
                {
                  step: "04",
                  title: "Hack-Proof Exchange",
                  desc: "Zero-attack-surface exchange layer. All transactions verified through hardware-isolated ZVC environments before execution.",
                  icon: <Shield size={20} />,
                  color: "#c084fc",
                },
              ].map((step, i) => (
                <div
                  key={step.title}
                  className="fade-in-up text-center"
                  style={{ transitionDelay: `${i * 0.15}s` }}
                  data-ocid={`howitworks.item.${i + 1}`}
                >
                  {/* Circle */}
                  <div
                    className="w-14 h-14 rounded-full flex items-center justify-center text-white font-bold text-lg mx-auto mb-6 relative"
                    style={{
                      background: `radial-gradient(circle at center, ${step.color}33, ${step.color}11)`,
                      border: `2px solid ${step.color}66`,
                      boxShadow: `0 0 20px ${step.color}33`,
                    }}
                  >
                    <span style={{ color: step.color }}>{step.step}</span>
                  </div>
                  <div className="mb-3" style={{ color: step.color }}>
                    {step.icon}
                  </div>
                  <h3 className="text-white font-semibold text-lg mb-2">
                    {step.title}
                  </h3>
                  <p className="text-gray-400 text-sm leading-relaxed px-2">
                    {step.desc}
                  </p>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── Roadmap ───────────────────────────────────────────────── */}
      <section
        id="roadmap"
        data-ocid="roadmap.section"
        className="py-24 relative"
        style={{
          background:
            "radial-gradient(ellipse at 50% 50%, rgba(14,165,233,0.04) 0%, transparent 60%), #000",
        }}
      >
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="font-display text-4xl sm:text-5xl font-bold text-white fade-in-up">
              Product <span className="gradient-text">Roadmap</span>
            </h2>
            <p
              className="text-gray-400 text-lg mt-4 max-w-xl mx-auto fade-in-up"
              style={{ transitionDelay: "0.1s" }}
            >
              A four-phase journey from hardware wallet to global quantum-safe
              Web3 network.
            </p>
          </div>

          {/* Timeline */}
          <div className="relative">
            <div className="hidden md:block absolute top-8 left-0 right-0 h-0.5 timeline-line z-0" />
            <div className="grid grid-cols-1 md:grid-cols-4 gap-8 relative z-10">
              {[
                {
                  phase: "Phase 1",
                  year: "2024",
                  title: "QLT Hardware Wallet",
                  desc: "Consumer-grade quantum-secure hardware wallet. The first device to protect crypto assets from both classical and quantum attacks.",
                  status: "active",
                  icon: <Wallet size={20} />,
                },
                {
                  phase: "Phase 2",
                  year: "2025",
                  title: "Secure Exchange Infrastructure",
                  desc: "B2B exchange security layer. QLT-secured trading infrastructure for institutional crypto exchanges.",
                  status: "upcoming",
                  icon: <Building size={20} />,
                },
                {
                  phase: "Phase 3",
                  year: "2026",
                  title: "QLT DeFi Ecosystem",
                  desc: "Quantum-safe DeFi protocol integrations. Bringing ZVC and 3SoC protection to decentralized finance.",
                  status: "future",
                  icon: <TrendingUp size={20} />,
                },
                {
                  phase: "Phase 4",
                  year: "2027",
                  title: "Quantum-Secure Web3 Network",
                  desc: "Full decentralized quantum-safe network. The foundation for the next generation of internet finance infrastructure.",
                  status: "future",
                  icon: <Globe size={20} />,
                },
              ].map((phase, i) => (
                <div
                  key={phase.title}
                  className="fade-in-up"
                  style={{ transitionDelay: `${i * 0.12}s` }}
                  data-ocid={`roadmap.item.${i + 1}`}
                >
                  {/* Timeline dot */}
                  <div className="flex justify-center mb-4">
                    <div
                      className={`w-16 h-16 rounded-full flex items-center justify-center text-white ${
                        phase.status === "active" ? "pulse-glow" : ""
                      }`}
                      style={{
                        background:
                          phase.status === "active"
                            ? "linear-gradient(135deg, #0ea5e9, #7c3aed)"
                            : phase.status === "upcoming"
                              ? "rgba(14,165,233,0.15)"
                              : "rgba(255,255,255,0.05)",
                        border:
                          phase.status === "active"
                            ? "2px solid rgba(14,165,233,0.8)"
                            : phase.status === "upcoming"
                              ? "2px solid rgba(14,165,233,0.4)"
                              : "2px solid rgba(255,255,255,0.1)",
                      }}
                    >
                      {phase.icon}
                    </div>
                  </div>
                  <div
                    className="rounded-xl p-5 text-center glass-card"
                    style={{
                      border:
                        phase.status === "active"
                          ? "1px solid rgba(14,165,233,0.4)"
                          : "1px solid rgba(255,255,255,0.08)",
                    }}
                  >
                    <div className="text-qblue text-xs font-mono font-bold mb-1">
                      {phase.phase} · {phase.year}
                    </div>
                    {phase.status === "active" && (
                      <div
                        className="inline-block px-2 py-0.5 rounded text-xs mb-2"
                        style={{
                          background: "rgba(14,165,233,0.2)",
                          color: "#38bdf8",
                          border: "1px solid rgba(14,165,233,0.3)",
                        }}
                      >
                        In Development
                      </div>
                    )}
                    <h3 className="text-white font-semibold mb-2">
                      {phase.title}
                    </h3>
                    <p className="text-gray-400 text-xs leading-relaxed">
                      {phase.desc}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── Market ────────────────────────────────────────────────── */}
      <section
        id="market"
        data-ocid="market.section"
        className="py-24"
        style={{
          background:
            "radial-gradient(ellipse at 50% 50%, rgba(168,85,247,0.06) 0%, transparent 60%), #000",
        }}
      >
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="font-display text-4xl sm:text-5xl font-bold text-white fade-in-up">
              A <span className="gradient-text">Trillion-Dollar</span> Market
              Opportunity
            </h2>
            <p
              className="text-gray-400 text-lg mt-4 max-w-2xl mx-auto fade-in-up"
              style={{ transitionDelay: "0.1s" }}
            >
              The quantum computing threat creates urgency for immediate
              infrastructure replacement across all crypto markets.
            </p>
          </div>

          <div className="grid md:grid-cols-3 gap-6 mb-12">
            {[
              {
                label: "TAM",
                sublabel: "Global Blockchain Market (100%)",
                value: "€191.1B",
                desc: "Global Blockchain Market considered as Total Addressable Market. Source: PrecedenceResearch.com (Projected 2029)",
                color: "#0ea5e9",
                bg: "rgba(14,165,233,0.08)",
                border: "rgba(14,165,233,0.25)",
                size: "lg",
              },
              {
                label: "SAM",
                sublabel: "Blockchain Security Market (17%)",
                value: "€33B",
                desc: "Blockchain Security Market considered as Serviceable Available Market",
                color: "#a855f7",
                bg: "rgba(168,85,247,0.08)",
                border: "rgba(168,85,247,0.25)",
                size: "md",
              },
              {
                label: "SOM",
                sublabel: "QLT's Target Share by 2029 (1%)",
                value: "€330M",
                desc: "QLT's Target Share of SAM by 2029 based on 1% market penetration",
                color: "#00f5ff",
                bg: "rgba(0,245,255,0.06)",
                border: "rgba(0,245,255,0.2)",
                size: "sm",
              },
            ].map((item, i) => (
              <div
                key={item.label}
                className="fade-in-up rounded-xl p-8 text-center hover:scale-[1.02] transition-all duration-300"
                style={{
                  background: item.bg,
                  border: `1px solid ${item.border}`,
                  transitionDelay: `${i * 0.1}s`,
                }}
                data-ocid="market.card"
              >
                <div
                  className="text-sm font-mono font-bold uppercase tracking-widest mb-2"
                  style={{ color: item.color }}
                >
                  {item.label}
                </div>
                <div
                  className="text-5xl font-display font-bold mb-2"
                  style={{ color: item.color }}
                >
                  {item.value}
                </div>
                <div className="text-white text-sm font-medium mb-3">
                  {item.sublabel}
                </div>
                <p className="text-gray-500 text-xs leading-relaxed">
                  {item.desc}
                </p>
              </div>
            ))}
          </div>

          <div className="fade-in-up glass-card rounded-xl p-8 text-center">
            <div className="text-3xl font-display font-bold gradient-text mb-2">
              €95M NPV
            </div>
            <p className="text-gray-300 text-lg">
              Based on a conservative 1% penetration of the Serviceable
              Available Market in 5 years. Source: PrecedenceResearch.com
            </p>
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── Business Model ────────────────────────────────────────── */}
      <section
        id="businessmodel"
        data-ocid="businessmodel.section"
        className="py-24"
        style={{ background: "#000" }}
      >
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="font-display text-4xl sm:text-5xl font-bold text-white fade-in-up">
              Dual-Revenue <span className="gradient-text">Business Model</span>
            </h2>
            <p
              className="text-gray-400 text-lg mt-4 max-w-xl mx-auto fade-in-up"
              style={{ transitionDelay: "0.1s" }}
            >
              QLT Adopts a Unified B2B-B2C model to drive adoption across
              blockchain ecosystems.
            </p>
          </div>

          <div className="grid md:grid-cols-2 gap-8">
            {/* B2B */}
            <div
              className="fade-in-up rounded-xl p-8"
              style={{
                background: "rgba(14,165,233,0.06)",
                border: "1px solid rgba(14,165,233,0.2)",
              }}
            >
              <div className="flex items-center gap-3 mb-6">
                <div
                  className="w-10 h-10 rounded-lg flex items-center justify-center"
                  style={{
                    background: "rgba(14,165,233,0.15)",
                    border: "1px solid rgba(14,165,233,0.3)",
                  }}
                >
                  <Building size={20} className="text-qblue" />
                </div>
                <div>
                  <div className="text-qblue text-xs font-mono font-bold uppercase tracking-widest">
                    B2B
                  </div>
                  <h3 className="text-white font-semibold text-xl">
                    Enterprise Infrastructure
                  </h3>
                </div>
              </div>
              <ul className="space-y-3">
                {[
                  "3SoC Server Deployment for Blockchain Protocols & Crypto Exchanges",
                  "Blockchain Infrastructure: Hosting Blockchain Nodes/Exchanges over 3SoC servers",
                  "B2B Associations with major DeFi protocols and blockchain infrastructure providers",
                  "Enterprise licensing for secure node deployment",
                  "Institutional quantum-safe security contracts",
                ].map((item, _i) => (
                  <li
                    key={item}
                    className="flex items-start gap-3 text-gray-300 text-sm"
                  >
                    <CheckCircle
                      size={16}
                      className="text-qblue mt-0.5 shrink-0"
                    />
                    {item}
                  </li>
                ))}
              </ul>
            </div>

            {/* B2C */}
            <div
              className="fade-in-up rounded-xl p-8"
              style={{
                background: "rgba(168,85,247,0.06)",
                border: "1px solid rgba(168,85,247,0.2)",
                transitionDelay: "0.1s",
              }}
            >
              <div className="flex items-center gap-3 mb-6">
                <div
                  className="w-10 h-10 rounded-lg flex items-center justify-center"
                  style={{
                    background: "rgba(168,85,247,0.15)",
                    border: "1px solid rgba(168,85,247,0.3)",
                  }}
                >
                  <Wallet size={20} className="text-qpurple" />
                </div>
                <div>
                  <div className="text-qpurple text-xs font-mono font-bold uppercase tracking-widest">
                    B2C
                  </div>
                  <h3 className="text-white font-semibold text-xl">
                    Consumer Ecosystem
                  </h3>
                </div>
              </div>
              <ul className="space-y-3">
                {[
                  "QLT/3SoC Wallet: Hardware wallet sales to Magpie community",
                  "Joint ICO Campaign to boost the crypto economy",
                  "Crypto Community: Pre-orders via crowdfunding campaign",
                  "Token sales to build and strengthen the community",
                  "Consumer quantum-security hardware ecosystem",
                ].map((item, _i) => (
                  <li
                    key={item}
                    className="flex items-start gap-3 text-gray-300 text-sm"
                  >
                    <CheckCircle
                      size={16}
                      className="text-qpurple mt-0.5 shrink-0"
                    />
                    {item}
                  </li>
                ))}
              </ul>
            </div>
          </div>

          <div className="mt-8 fade-in-up glass-card rounded-xl p-6 text-center">
            <div className="text-4xl font-display font-bold gradient-text-neon mb-2">
              $50M ARR
            </div>
            <p className="text-gray-400">
              Revenue target by Year 3, driven by enterprise exchange contracts
              and consumer hardware sales
            </p>
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── Competitive ───────────────────────────────────────────── */}
      <section
        id="competitive"
        data-ocid="competitive.section"
        className="py-24"
        style={{
          background:
            "radial-gradient(ellipse at 50% 0%, rgba(14,165,233,0.05) 0%, transparent 50%), #000",
        }}
      >
        <div className="max-w-5xl mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="font-display text-4xl sm:text-5xl font-bold text-white fade-in-up">
              Why <span className="gradient-text">QLT Wins</span>
            </h2>
            <p
              className="text-gray-400 text-lg mt-4 max-w-xl mx-auto fade-in-up"
              style={{ transitionDelay: "0.1s" }}
            >
              PQC has a 97% failure rate — 80 out of 82 NIST candidates already
              rejected. It's incompatible with 70–85% of legacy IoT devices and
              still relies on vulnerable user-facing handshakes. QLT eliminates
              these flaws entirely.
            </p>
          </div>

          <div className="fade-in-up overflow-x-auto">
            <table
              className="w-full min-w-[600px]"
              data-ocid="competitive.table"
            >
              <thead>
                <tr>
                  <th className="text-left py-4 px-4 text-gray-400 font-medium">
                    Feature
                  </th>
                  <th className="text-center py-4 px-4 text-gray-400 font-medium">
                    Traditional
                  </th>
                  <th className="text-center py-4 px-4 text-gray-400 font-medium">
                    Post-Quantum Crypto
                  </th>
                  <th
                    className="text-center py-4 px-6 font-bold rounded-t-xl"
                    style={{
                      background: "rgba(14,165,233,0.15)",
                      color: "#38bdf8",
                      border: "1px solid rgba(14,165,233,0.3)",
                      borderBottom: "none",
                    }}
                  >
                    QLT Architecture
                  </th>
                </tr>
              </thead>
              <tbody>
                {[
                  ["Quantum Resistance", false, "partial", true],
                  ["Hardware-Level Isolation", false, false, true],
                  ["Zero Attack Surface", false, false, true],
                  ["Blockchain Agnostic", true, "partial", true],
                  ["Real-time Protection", "partial", false, true],
                  ["Scalability", true, "partial", true],
                  ["Energy Efficiency", false, false, true],
                  ["Legacy IoT Compatibility", true, false, true],
                ].map(([feature, trad, pqc, qlt], i) => (
                  <tr
                    key={String(feature)}
                    className={i % 2 === 0 ? "bg-white/[0.02]" : ""}
                  >
                    <td className="py-4 px-4 text-gray-300 text-sm font-medium">
                      {feature as string}
                    </td>
                    <td className="text-center py-4 px-4">
                      {renderCompCell(trad)}
                    </td>
                    <td className="text-center py-4 px-4">
                      {renderCompCell(pqc)}
                    </td>
                    <td
                      className="text-center py-4 px-6"
                      style={{
                        background: "rgba(14,165,233,0.08)",
                        border: "1px solid rgba(14,165,233,0.2)",
                        borderTop: "none",
                        borderBottom:
                          i === 7 ? "1px solid rgba(14,165,233,0.3)" : "none",
                      }}
                    >
                      {renderCompCell(qlt)}
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── Team ──────────────────────────────────────────────────── */}
      <section
        id="team"
        data-ocid="team.section"
        className="py-24"
        style={{ background: "#000" }}
      >
        <div className="max-w-6xl mx-auto px-4">
          <div className="text-center mb-16">
            <h2 className="font-display text-4xl sm:text-5xl font-bold text-white fade-in-up">
              Leadership <span className="gradient-text">Team</span>
            </h2>
            <p
              className="text-gray-400 text-lg mt-4 max-w-xl mx-auto fade-in-up"
              style={{ transitionDelay: "0.1s" }}
            >
              World-class experts in quantum cryptography, blockchain
              infrastructure, and deep-tech commercialization.
            </p>
          </div>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {[
              {
                name: "David Bell",
                title: "CEO",
                bio: "Corporate strategist, crypto investor, expert in building and managing crypto networks, adroit in offering executive oversight",
                initials: "DB",
                gradient: "linear-gradient(135deg, #0ea5e9, #7c3aed)",
              },
              {
                name: "Fazal Raheman",
                title: "Inventor, QLT",
                bio: "Research scientist, innovator, visionary and serial inventor with over 37 global patents",
                initials: "FR",
                gradient: "linear-gradient(135deg, #a855f7, #0ea5e9)",
              },
              {
                name: "Michael Schuette",
                title: "CTO",
                bio: "Research Scientist, Expert in NVM, cybersecurity and Solid-State drive technology with over 53 Patents in the same field",
                initials: "MS",
                gradient: "linear-gradient(135deg, #00f5ff, #0ea5e9)",
              },
              {
                name: "Tejas Bhagat",
                title: "Head, QLT Program",
                bio: "Program Manager, Grant writer, architect of deep tech ecosystems, program lead for lab-to-market value creation",
                initials: "TB",
                gradient: "linear-gradient(135deg, #38bdf8, #a855f7)",
              },
              {
                name: "Ali Raheman",
                title: "CSO",
                bio: "Cofounder of 2 successful start ups and Lead for positioning the investment strategies for QLT",
                initials: "AR",
                gradient: "linear-gradient(135deg, #7c3aed, #0ea5e9)",
              },
              {
                name: "Ikram Ansari",
                title: "Head, Marketing",
                bio: "Cofounder and Dynamic professional with over 8 years of experience in sales, marketing and relationship management in B2C, B2B",
                initials: "IA",
                gradient: "linear-gradient(135deg, #c084fc, #38bdf8)",
              },
              {
                name: "Rushi Chavan",
                title: "Head, Software Dev",
                bio: "Software Engineer with specialization in Blockchain, smart contract specialist, full-stack developer, 10+ years in decentralized systems",
                initials: "RC",
                gradient: "linear-gradient(135deg, #0ea5e9, #00f5ff)",
              },
            ].map((member, i) => (
              <TeamCard key={member.name} {...member} index={i} />
            ))}
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── Investment ────────────────────────────────────────────── */}
      <section
        id="investment"
        data-ocid="investment.section"
        className="py-24 relative"
        style={{
          background:
            "radial-gradient(ellipse at 50% 50%, rgba(14,165,233,0.12) 0%, rgba(168,85,247,0.08) 40%, transparent 70%), #000",
        }}
      >
        <div className="max-w-5xl mx-auto px-4 text-center">
          <div className="inline-flex items-center gap-2 mb-6 px-4 py-2 rounded-full glass-card-blue text-qblue text-sm fade-in">
            <Zap size={14} /> Seed Investment Round Open
          </div>
          <h2 className="font-display text-4xl sm:text-5xl font-bold text-white mb-6 fade-in-up">
            Seed <span className="gradient-text">Investment Opportunity</span>
          </h2>
          <p
            className="text-gray-300 text-xl max-w-3xl mx-auto mb-12 fade-in-up"
            style={{ transitionDelay: "0.1s" }}
          >
            QLT is seeking{" "}
            <span className="text-white font-bold">
              $2.5M in strategic seed investment
            </span>{" "}
            to accelerate development of quantum-safe blockchain infrastructure
            and bring Phase 1 products to market.
          </p>

          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-5 mb-12">
            {[
              {
                icon: <Shield size={24} />,
                title: "Deep Tech",
                desc: "Patented architecture with multiple pending patents across ZVC, 3SoC, and QRUECA",
                color: "#0ea5e9",
              },
              {
                icon: <TrendingUp size={24} />,
                title: "Massive Market",
                desc: "€191.1B total addressable market with QLT targeting 1% penetration — €330M SOM by 2029",
                color: "#a855f7",
              },
              {
                icon: <Zap size={24} />,
                title: "First Mover",
                desc: "No comparable quantum-native blockchain security solution exists anywhere in market",
                color: "#00f5ff",
              },
              {
                icon: <AlertCircle size={24} />,
                title: "Strategic Timing",
                desc: "Quantum threat timeline creates investor urgency — window to establish dominance is now",
                color: "#38bdf8",
              },
            ].map((card, i) => (
              <div
                key={card.title}
                className="fade-in-up rounded-xl p-6 text-left"
                style={{
                  background: `rgba(${card.color === "#0ea5e9" ? "14,165,233" : card.color === "#a855f7" ? "168,85,247" : card.color === "#00f5ff" ? "0,245,255" : "56,189,248"},0.08)`,
                  border: `1px solid ${card.color}33`,
                  transitionDelay: `${i * 0.1}s`,
                }}
                data-ocid="investment.card"
              >
                <div className="mb-3" style={{ color: card.color }}>
                  {card.icon}
                </div>
                <h3 className="text-white font-semibold mb-2">{card.title}</h3>
                <p className="text-gray-400 text-xs leading-relaxed">
                  {card.desc}
                </p>
              </div>
            ))}
          </div>

          <div
            className="flex flex-col sm:flex-row gap-4 justify-center fade-in-up"
            style={{ transitionDelay: "0.4s" }}
          >
            <Button
              onClick={() => scrollTo("contact")}
              data-ocid="investment.primary_button"
              size="lg"
              className="px-8 py-3 rounded-lg font-semibold text-base"
              style={{
                background: "linear-gradient(135deg, #0ea5e9, #7c3aed)",
                border: "none",
                color: "white",
                boxShadow: "0 0 30px rgba(14,165,233,0.4)",
              }}
            >
              Request Investor Deck <ArrowRight size={16} />
            </Button>
            <Button
              onClick={() => scrollTo("contact")}
              data-ocid="investment.secondary_button"
              size="lg"
              variant="outline"
              className="px-8 py-3 rounded-lg font-semibold text-base"
              style={{
                borderColor: "rgba(14,165,233,0.4)",
                color: "#38bdf8",
                background: "transparent",
              }}
            >
              Schedule Meeting
            </Button>
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── Contact ───────────────────────────────────────────────── */}
      <section
        id="contact"
        data-ocid="contact.section"
        className="py-24"
        style={{ background: "#000" }}
      >
        <div className="max-w-3xl mx-auto px-4">
          <div className="text-center mb-12">
            <h2 className="font-display text-4xl sm:text-5xl font-bold text-white fade-in-up">
              Get <span className="gradient-text">In Touch</span>
            </h2>
            <p
              className="text-gray-400 text-lg mt-4 fade-in-up"
              style={{ transitionDelay: "0.1s" }}
            >
              Join us in building the quantum-safe future of finance.
            </p>
          </div>

          <div
            className="fade-in-up glass-card rounded-2xl p-8"
            style={{ border: "1px solid rgba(14,165,233,0.2)" }}
          >
            {formState === "success" ? (
              <div
                className="text-center py-12"
                data-ocid="contact.success_state"
              >
                <CheckCircle
                  size={48}
                  className="text-green-400 mx-auto mb-4"
                />
                <h3 className="text-white text-2xl font-bold mb-2">
                  Thank You!
                </h3>
                <p className="text-gray-400">
                  We'll be in touch within 24 hours.
                </p>
              </div>
            ) : (
              <form onSubmit={handleSubmit} className="space-y-6">
                <div className="grid sm:grid-cols-2 gap-4">
                  <div>
                    <Label className="text-gray-300 text-sm mb-2 block">
                      Full Name *
                    </Label>
                    <Input
                      data-ocid="contact.input"
                      placeholder="Your name"
                      value={formData.name}
                      onChange={(e) =>
                        setFormData((p) => ({ ...p, name: e.target.value }))
                      }
                      className="bg-white/5 border-white/10 text-white placeholder:text-gray-600 focus:border-qblue"
                    />
                  </div>
                  <div>
                    <Label className="text-gray-300 text-sm mb-2 block">
                      Email Address *
                    </Label>
                    <Input
                      data-ocid="contact.input"
                      type="email"
                      placeholder="you@company.com"
                      value={formData.email}
                      onChange={(e) =>
                        setFormData((p) => ({ ...p, email: e.target.value }))
                      }
                      className="bg-white/5 border-white/10 text-white placeholder:text-gray-600 focus:border-qblue"
                    />
                  </div>
                </div>

                <div>
                  <Label className="text-gray-300 text-sm mb-2 block">
                    Company / Fund *
                  </Label>
                  <Input
                    data-ocid="contact.input"
                    placeholder="Your company or fund name"
                    value={formData.company}
                    onChange={(e) =>
                      setFormData((p) => ({ ...p, company: e.target.value }))
                    }
                    className="bg-white/5 border-white/10 text-white placeholder:text-gray-600 focus:border-qblue"
                  />
                </div>

                <div>
                  <Label className="text-gray-300 text-sm mb-2 block">
                    Investment Interest *
                  </Label>
                  <Select
                    value={formData.interestLevel}
                    onValueChange={(val) =>
                      setFormData((p) => ({ ...p, interestLevel: val }))
                    }
                  >
                    <SelectTrigger
                      data-ocid="contact.select"
                      className="bg-white/5 border-white/10 text-white focus:border-qblue"
                    >
                      <SelectValue placeholder="Select investment range" />
                    </SelectTrigger>
                    <SelectContent className="bg-gray-900 border-white/10">
                      <SelectItem value="$100K-$500K">$100K – $500K</SelectItem>
                      <SelectItem value="$500K-$1M">$500K – $1M</SelectItem>
                      <SelectItem value="$1M-$5M">$1M – $5M</SelectItem>
                      <SelectItem value="$5M+">$5M+</SelectItem>
                      <SelectItem value="Strategic Partnership">
                        Strategic Partnership
                      </SelectItem>
                    </SelectContent>
                  </Select>
                </div>

                <div>
                  <Label className="text-gray-300 text-sm mb-2 block">
                    Message (Optional)
                  </Label>
                  <Textarea
                    data-ocid="contact.textarea"
                    placeholder="Tell us about your investment thesis or partnership interest..."
                    value={textarea}
                    onChange={(e) => setTextarea(e.target.value)}
                    rows={3}
                    className="bg-white/5 border-white/10 text-white placeholder:text-gray-600 focus:border-qblue resize-none"
                  />
                </div>

                {formState === "error" && (
                  <div
                    data-ocid="contact.error_state"
                    className="flex items-center gap-2 p-3 rounded-lg text-red-400 text-sm"
                    style={{
                      background: "rgba(239,68,68,0.1)",
                      border: "1px solid rgba(239,68,68,0.2)",
                    }}
                  >
                    <XCircle size={16} /> {errorMsg}
                  </div>
                )}

                <Button
                  type="submit"
                  data-ocid="contact.submit_button"
                  disabled={formState === "loading"}
                  className="w-full py-3 text-base font-semibold rounded-lg"
                  style={{
                    background: "linear-gradient(135deg, #0ea5e9, #7c3aed)",
                    border: "none",
                    color: "white",
                    boxShadow:
                      formState !== "loading"
                        ? "0 0 20px rgba(14,165,233,0.3)"
                        : "none",
                    opacity: formState === "loading" ? 0.7 : 1,
                  }}
                >
                  {formState === "loading" ? (
                    <span className="flex items-center gap-2 justify-center">
                      <svg
                        aria-hidden="true"
                        className="animate-spin h-4 w-4"
                        viewBox="0 0 24 24"
                        fill="none"
                      >
                        <circle
                          className="opacity-25"
                          cx="12"
                          cy="12"
                          r="10"
                          stroke="currentColor"
                          strokeWidth="4"
                        />
                        <path
                          className="opacity-75"
                          fill="currentColor"
                          d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4z"
                        />
                      </svg>
                      Submitting...
                    </span>
                  ) : (
                    <span className="flex items-center gap-2 justify-center">
                      Send Message <Send size={16} />
                    </span>
                  )}
                </Button>
              </form>
            )}
          </div>

          {/* Contact links */}
          <div
            className="mt-8 flex flex-col sm:flex-row items-center justify-center gap-6 text-gray-400 fade-in-up"
            style={{ transitionDelay: "0.2s" }}
          >
            <a
              href="mailto:investors@quantumledger.tech"
              className="flex items-center gap-2 hover:text-qblue transition-colors"
              data-ocid="contact.link"
            >
              <Mail size={16} /> investors@quantumledger.tech
            </a>
            <div className="flex items-center gap-3">
              <a
                href="https://linkedin.com"
                target="_blank"
                rel="noopener noreferrer"
                aria-label="LinkedIn"
                className="hover:text-qblue transition-colors"
                data-ocid="contact.link"
              >
                <Linkedin size={20} />
              </a>
              <a
                href="https://twitter.com"
                target="_blank"
                rel="noopener noreferrer"
                aria-label="Twitter/X"
                className="hover:text-qblue transition-colors"
                data-ocid="contact.link"
              >
                <Twitter size={20} />
              </a>
              <a
                href="https://t.me"
                target="_blank"
                rel="noopener noreferrer"
                aria-label="Telegram"
                className="hover:text-qblue transition-colors"
                data-ocid="contact.link"
              >
                <Send size={20} />
              </a>
            </div>
          </div>
        </div>
      </section>

      <div className="section-divider" />

      {/* ── Footer ────────────────────────────────────────────────── */}
      <footer
        className="py-16"
        style={{
          background: "rgba(0,0,0,0.8)",
          borderTop: "1px solid rgba(14,165,233,0.1)",
        }}
      >
        <div className="max-w-6xl mx-auto px-4">
          <div className="grid grid-cols-1 md:grid-cols-5 gap-8 mb-12">
            {/* Brand */}
            <div className="md:col-span-2">
              <div className="flex items-center gap-2 mb-4">
                <img
                  src="/assets/generated/qlt-logo-transparent.dim_400x400.png"
                  alt="QLT"
                  className="w-8 h-8 object-contain"
                />
                <span className="font-display font-bold text-xl gradient-text">
                  QLT
                </span>
              </div>
              <p className="text-gray-400 text-sm leading-relaxed mb-4">
                Quantum-Safe Infrastructure for the Future of Finance.
                Protecting blockchain, DeFi, and Web3 from the quantum threat.
              </p>
              <div className="flex items-center gap-3">
                <a
                  href="https://linkedin.com"
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="LinkedIn"
                  className="text-gray-500 hover:text-qblue transition-colors"
                  data-ocid="footer.link"
                >
                  <Linkedin size={18} />
                </a>
                <a
                  href="https://twitter.com"
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Twitter"
                  className="text-gray-500 hover:text-qblue transition-colors"
                  data-ocid="footer.link"
                >
                  <Twitter size={18} />
                </a>
                <a
                  href="https://t.me"
                  target="_blank"
                  rel="noopener noreferrer"
                  aria-label="Telegram"
                  className="text-gray-500 hover:text-qblue transition-colors"
                  data-ocid="footer.link"
                >
                  <Send size={18} />
                </a>
              </div>
            </div>

            {/* Links */}
            {[
              {
                title: "Technology",
                links: [
                  "ZVC Architecture",
                  "3SoC Platform",
                  "QRUECA Auth",
                  "Whitepaper",
                ],
              },
              {
                title: "Company",
                links: ["About", "Team", "Roadmap", "Careers"],
              },
              {
                title: "Legal",
                links: [
                  "Privacy Policy",
                  "Terms of Service",
                  "IP Disclosure",
                  "SEC Disclaimer",
                ],
              },
            ].map((col) => (
              <div key={col.title}>
                <h4 className="text-white font-semibold text-sm mb-4">
                  {col.title}
                </h4>
                <ul className="space-y-2">
                  {col.links.map((link) => (
                    <li key={link}>
                      <a
                        href="/"
                        className="text-gray-500 text-sm hover:text-gray-300 transition-colors"
                        data-ocid="footer.link"
                      >
                        {link}
                      </a>
                    </li>
                  ))}
                </ul>
              </div>
            ))}
          </div>

          {/* Bottom bar */}
          <div
            className="pt-8 flex flex-col sm:flex-row items-center justify-between gap-4"
            style={{ borderTop: "1px solid rgba(255,255,255,0.06)" }}
          >
            <p className="text-gray-600 text-sm">
              © {new Date().getFullYear()} Quantum Ledger Technology. All rights
              reserved.
            </p>
            <div className="flex items-center gap-4">
              <a
                href="/whitepaper.pdf"
                className="flex items-center gap-2 text-gray-500 text-sm hover:text-qblue transition-colors"
                data-ocid="footer.link"
              >
                <Download size={14} /> Download Whitepaper
              </a>
              <a
                href="mailto:investors@quantumledger.tech"
                className="flex items-center gap-2 text-gray-500 text-sm hover:text-qblue transition-colors"
                data-ocid="footer.link"
              >
                <Mail size={14} /> Investor Contact
              </a>
            </div>
          </div>

          {/* Caffeine attribution */}
          <div className="mt-6 text-center">
            <a
              href={`https://caffeine.ai?utm_source=caffeine-footer&utm_medium=referral&utm_content=${encodeURIComponent(window.location.hostname)}`}
              target="_blank"
              rel="noopener noreferrer"
              className="text-gray-700 text-xs hover:text-gray-500 transition-colors"
            >
              © {new Date().getFullYear()}. Built with ❤️ using caffeine.ai
            </a>
          </div>
        </div>
      </footer>
    </div>
  );
}

// ─── Helper: render comparison cell ──────────────────────────────────────────
function renderCompCell(val: boolean | string) {
  if (val === true)
    return <CheckCircle size={18} className="text-green-400 mx-auto" />;
  if (val === false)
    return <XCircle size={18} className="text-red-500 mx-auto" />;
  return <span className="text-yellow-400 text-xs font-medium">Partial</span>;
}
