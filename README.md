# AISViz Website

AISViz Website is the static landing page for the AISViz project, an open-source effort to make maritime informatics accessible through tools built around Automatic Identification System (AIS) data. It is served by GitHub Pages on the custom domain [aisviz.cs.dal.ca](https://aisviz.cs.dal.ca) and points visitors to the documentation, API reference, source code, and chatbot assistants. The site is a single Bootstrap 5 page with no build step, developed and maintained by the [MAPS Lab](https://mapslab.tech/) at Dalhousie University, continuing work that began under the [MERIDIAN](https://meridian.cs.dal.ca) initiative.

## Contents

| File | Purpose |
|------|---------|
| `index.html` | Landing page (Bootstrap 5 and Font Awesome via CDN) |
| `style.css` | Site-specific styles |
| `CNAME` | Custom domain for GitHub Pages |
| `LICENSE` | MIT license text |

## Local preview

No build step is required. Open `index.html` directly in a browser, or serve the directory locally from the repository root.

```bash
python3 -m http.server 8000
```

Then visit http://localhost:8000.

## Deployment

GitHub Pages serves the site from the `main` branch, and the `CNAME` file binds it to the custom domain [aisviz.cs.dal.ca](https://aisviz.cs.dal.ca). Every push to `main` publishes automatically, with no workflow or build step involved.

## Documentation

[Documentation](https://aisviz.gitbook.io/documentation/) · [Tutorials](https://aisviz.gitbook.io/tutorials/) · [API reference](https://aisviz.cs.dal.ca/AISdb/) · [Website](https://aisviz.cs.dal.ca/)

## Related projects

- [AISdb](https://github.com/MAPS-Lab/AISdb) is the Python package for smart AIS data storage and integration.
- [AISdb-lite](https://github.com/MAPS-Lab/AISdb-lite) is a lightweight version of AISdb with spatio-temporal capabilities on PostGIS and TigerData.
- [NOAA-Integrator](https://github.com/MAPS-Lab/NOAA-Integrator) acquires and processes Marine Cadastre AIS data into an AISdb-aligned database.
- [Tutorials](https://github.com/MAPS-Lab/AISdb-Tutorials) holds hands-on Jupyter notebooks that walk through AISdb, from database loading to bathymetry.

## Citation

If you use the AISViz website in your work, please cite it. Citation metadata lives in [CITATION.cff](CITATION.cff), and the BibTeX entry follows.

```bibtex
@software{AISViz2026:GSpadon,
  author    = {Spadon, Gabriel},
  title     = {AISViz Website},
  year      = {2026},
  publisher = {MAPS Lab, Dalhousie University},
  url       = {https://github.com/MAPS-Lab/aisviz.github.io},
  license   = {AGPL-3.0}
}
```

## License

This project is distributed under the terms of the GNU Affero General Public License v3.0 (AGPL-3.0). See [LICENSE](LICENSE) for details.
