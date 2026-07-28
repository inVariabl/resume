#let primary-font = "EB Garamond"
#let secondary-font = "Avenir Next LT Pro"

#set page(paper: "us-letter", margin: (x: 0.65in, y: 0.55in))
#set text(
  font: primary-font,
  size: 11pt,
  features: (
      "onum", // old-style figures
      "pnum", // proportional spacing
  ),
)
#set par(justify: false, leading: 0.55em)

#let section(title) = {
  block(
    // fill: luma(0),
    // inset: 0.25em,
    text(
      font: secondary-font,
      weight: "bold",
      tracking: -0.025em,
      fill: black,
      // fill: white,
      size: 0.75em,
      title
    )
  )
  v(-1em)
  line(length: 100%, stroke: 0.5pt)
  v(-0.5em)
}

#let entry(role, org, loc, dates, bullets) = {
  grid(
    align: (left, right),
    columns: (1fr, auto),
    [*#org* \ #role ],
    [#loc \ #dates],
  )
  v(-0.25em)
  for b in bullets [
    - #b
  ]
  v(0.5em)
}

#let project(name, tech, url, desc, date, bullets) = {
  grid(
    columns: (1fr, auto),
    align: (left, right),
    [*#name* #h(1em) _ #tech _ \ #desc],
    [#text(size: 1em, url) \ #date],
  )
  v(-0.25em)
  for b in bullets [
    - #b
  ]
  v(0.5em)
}


#let award(title, org, desc, date) = {
  grid(
    columns: (1fr, auto),
    [*#title* · #org],
    [#date],
  )
  v(-0.5em)
  [#desc]
  v(0.5em)
}

#let skills(..args) = {
  let pairs = args.pos()
  let cells = ()
  for i in range(0, pairs.len(), step: 2) {
    cells.push([*#pairs.at(i):*])
    cells.push(pairs.at(i + 1).join([, ]))
  }
  table(
    columns: (auto, 1fr),
    gutter: (0.25em),
    stroke: none,
    inset: (x: 0pt, y: 2pt),
    ..cells
  )
}

// Header

#align(center)[
  #v(-1em)
  #text(
    size: 2.5em,
    weight: 500,
    tracking: -0.025em,
    font: secondary-font)[Daniel J. Crooks]
  #v(-2em)
  #text(size: 1em)[
    Monrovia, CA $dot$
    #link("mailto:danonguitar@gmail.com")[danonguitar\@gmail.com] $dot$
    #link("tel:+16268255894")[(626) 825-5894] $dot$
    #link("https://linkedin.com/in/danieljcrooks")[linkedin.com/in/danieljcrooks] $dot$
    #link("https://github.com/inVariabl")[github.com/inVariabl]
  ]
]
#v(1em)

#section("Education")
#grid(
  columns: (1fr, auto),
  gutter: 0.5em,
  [*California Baptist University* $dot$ Riverside, CA],
  [Sep 2022 – Apr 2026],
  [B.S. in Computer Science, GPA: 3.61]
)

#section("Work Experience")
#entry(
  "Support Dev Intern",
  "IntelliEvent",
  "Riverside, CA",
  "Jun 2025 – Aug 2025",
  (
    // "Setup & tore down stage and audio visual equipment for an 3 day event with 100+ attendees.", // non-technical
    // "Ran errands, help prepare food, deliver drinks and clean bathrooms.", // non-technical
    // "Drove classic cars to and from Carmel to Monterey.", // non-technical
    // "Worked with a team of 5–6 Developers to address bugs and implement new feature requests.",
    "Redesigned 300+ HTML print templates for 100+ enterprise clients, improving maintainability and readability.",
    "Wrote tools to optimize company workflow, increase productivity and reduce errors in data.",
    "Attended daily standup meetings and code reviews, both in-person and online.",
  )
)
#entry(
  "Resident Advisor",
  "California Baptist University",
  "Riverside, CA",
  "Aug 2023 – Jun 2025",
  (
    "Assisted in moving in 400+ students to their dorms over the course of 2 days.",
    "Planned and implemented monthly social events & gatherings for 40+ Residents.",
    // "Met with residents on a weekly basis for mentorship, coffee and lunch."
    "Designed & implemented systems like ADP+ that increased workplace productivity by 17%.",
    // "Assisted International & Disabled residents with living on campus.",
  )
)

#entry(
  "Instructor",
  "IDTech - CalTech Campus",
  "Pasadena, CA",
  "Jun 2024 – Aug 2024",
  (
    "Taught Filmmaking and Programming Principles to HS Students.",
    "Worked with a team of instructors to plan lessons and effective teaching strategies.",
    "Fostered a safe and welcoming environment by encouraging collaboration.",
  )
)

// #entry(
//   "Karate Instructor",
//   "Kaizen Martial Arts & Fitness",
//   "Monrovia, CA",
//   "Aug 2021 - Aug 2022",
//   (
//     "Taught 3 classes at day to 50+ students, aged 5-17, helping them develop confidence and fine-motor skills.",
//     "Planned and coordinated birthday parties, Nerf wars, movie & game nights.",
//     "Answered the phone, sold memberships & merchandise, cleaned the bathrooms and emptied the trash daily.",
//   )
// )

#section("Projects")

#project(
  "gmesg",
  "Go, Bubble Tea, Cobra, Unix Sockets",
  link("https://github.com/inVariabl/gmesg")[github.com/inVariabl/gmesg],
  "Terminal client for Google Messages, with an interactive TUI and a scriptable CLI",
  "Jul 2026 – Present",
  (
    "Built terminal QR-code authentication against libgm's reverse-engineered RCS pairing protocol.",
    "Interactive TUI with vi-mode navigation, inline terminal image previews with ueberzug, attachments, and reactions.",
    "Refactored the daemon into an IPC server over Unix sockets so clients share sessions without corrupting auth tokens.",
  )
)

// #project(
//   "Haydock Study Bible",
//   "Next.js, React, TypeScript, TailwindCSS, Cloudflare",
//   link("https://bible.minions.tv")[bible.minions.tv],
//   "Web application for reading Scripture with verse-by-verse Catholic commentary",
//   "Jan 2026 – Apr 2026",
//   (
//     "Designed a responsive Bible reader with support for books, chapters, verses, and commentary views.",
//     "Built full-text search across all Bible verses with generated indexing and cached results.",
//     "Integrated Haydock and Cornelius a Lapide commentary with verse-by-verse navigation.",
//   )
// )

#project(
  "ADA Font Check",
  "C / WebAssembly, SvelteKit, TailwindCSS / DaisyUI",
  link("https://adafontcheck.xyz")[adafontcheck.xyz],
  "Web application that determines if font files meet ADA requirements",
  "Dec 2018 – May 2026",
  (
    "Designed a custom font glyph parsing algorithm based on Cartesian geometry.",
    "Rewrote analysis engine in C compiled to WebAssembly; scaled from crashing at ~1,000 fonts to processing batches of 10,000+ with flat memory usage.",
    // "Increased the accuracy of evaluation by eliminating human error.",
    "Used monthly in production by Selbert Perkins Design for the past 6 years.",
  )
)

#project(
  "St. Paul's Postal Service",
  "C, raylib, WebAssembly",
  link("https://invariabl.github.io/spps-raylib/")[invariabl.github.io/spps-raylib],
  "Educational RPG-style videogame that follows St. Paul's final missionary journey",
  "Sep 2025 – Apr 2026",
  (
    "Worked with 3 other seniors to plan and implement gameplay, storyline, and mechanics.",
    "Integrated A* Pathfinding algorithm for player and NPC movement.",
    "Implemented an on-the-fly camera system to switch between first and third-person POV.",
  )
)

// #project(
//   "Library App",
//   "SQL / MariaDB, Go, PicoCSS",
//   link("https://github.com/inVariabl/EGR325-Library-App")[github.com/inVariabl/EGR325-Library-App],
//   "Full-Stack Web Application to manage user checkout",
//   "Dec 2024",
//   (
//     "Worked on a team of 3 to create a custom database schema.",
//     "Designed a custom Go middleware and web frontend in HTML, Javascript and PicoCSS.",
//     "Handles user authentication, book checkout & return, and memberships.",
//   )
// )

// #project(
//   "Zac Hould Pottery",
//   "Jekyll, HTML / CSS, Netlify",
//   link("https://zachouldpottery.netlify.app")[zachouldpottery.netlify.app],
//   "Portfolio website for a ceramic artist",
//   "2024",
//   (
//     "Built a responsive static site with Jekyll and customized HTML/CSS to fit the artist's brand.",
//     "Designed a gallery layout to showcase ceramic work across devices.",
//   )
// )

// #project(
//   "Does Any Faith Suffice (Recusant Press)",
//   "Typst, Git, Typography & Layout Design",
//   link("https://a.co/d/0eEZfrTy"),
//   "Typeset full book interior for a Catholic theology title, published on Amazon KDP",
//   "May 2025",
//   (
//     "Typeset book interior according to client spec, using typographic hierarchy, spacing, and print-ready layout.",
//     "Typst, but the principles of typesetting (grid, rhythm, readability) carry directly into web UI design and the syntax is very HTML-like.",
//   )
// )

// #section("Volunteer Experience")
// #entry(
//   "Young Adult Ministry Leader",
//   "St. Thomas the Apostle",
//   "Riverside, CA",
//   "Sep 2025 – Apr 2026",
//   (
//     "Planned & led a weekly bible study for 20-30 young adults.",
//     "Organized ice-breaking activities, coordinated food and drinks.",
//     "Met with 2 other leaders on a weekly basis to organize material.",
//   )
// )

// #section("Awards")
// #award(
//   "Eagle Scout",
//   "Boy Scouts of America",
//   "Designed and built 6 benches and installed them in my High School Music building.",
//   "Jan 2019",
// )
// #v(-0.5em)
// #award(
//   "Black Belt",
//   "Shihan Tom Hould, Kaizen Martial Arts & Fitness",
//   "1st Degree Black Belt in Karate awarded after 6 years of training.",
//   "Dec 2018",
// )

#section("Skills")
#skills(
  "Languages", ("Javascript", "HTML / CSS", "PHP", "Java", "C++"),
  "Libraries", ("React", "NodeJS", "jQuery", "TailwindCSS", "Bootstrap"),
  "Additional", ("AWS", "GCP", "BASH / Linux", "GIT", "Jira", "WordPress"),
)
