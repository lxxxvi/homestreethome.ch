---
layout: releases
---

<div class="w-full">
  <ul class="grid grid-cols-2 gap-5">
    {% for resource in collections.releases.resources %}
      {% assign release = resource.release %}
      <li>
        <a href="{{ resource.relative_url }}" class="opacity-80 hover:opacity-100 transition flex flex-col gap-y-1">
          <img src="{{ release.cover_url }}" alt="Cover for {{ release.artist }} - {{ release.title }}" class="rounded-xl" />
          <div class="px-2 flex flex-col">
            <span class="text-xs text-gray-600 tracking-wider">{{ release.released_on }}</span>
            <span class="text-sm text-green-700 tracking-wider">{{ release.artist }}</span>
            <span>{{ release.title }}</span>
          </div>
        </a>
      </li>
    {% endfor %}
  </ul>
</div>
