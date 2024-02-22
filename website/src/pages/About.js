import React from "react";
import Nav from "../components/Nav.js";

export default function About() {
  return (
    <div>
      <Nav />
      <div class="h-56 grid grid-cols-3 gap-10 content-start ... ">
        <div class="bg-sky-500/100 ... mt-40 ...  ml-10...">01</div>
        <div class="bg-sky-500/100 ...">02</div>
        <div class="bg-sky-500/100 ...">03</div>
        <div>04</div>
        <div>05</div>
      </div>
    </div>
  );
}
