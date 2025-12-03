## 1. Country

| PK/FK | Atributo   | Tipo        | Restricciones |
|-------|------------|-------------|----------------|
| PK    | Code       | varchar(4)  | NOT NULL |
|       | Name       | varchar(50) | UNIQUE, NOT NULL |
|       | Capital    | varchar(50) |  |
|       | Province   | varchar(50) |  |
|       | Area       | decimal     | CHECK (Area >= 0) |
|       | Population | decimal     | CHECK (Population >= 0) |

## 2. City

| PK/FK | Atributo   | Tipo        | Restricciones |
|-------|------------|-------------|----------------|
| PK    | Name       | varchar(50) | NOT NULL |
| PK/FK | Country    | varchar(4)  | NOT NULL |
| PK/FK | Province   | varchar(50) | NOT NULL |
|       | Population | decimal     | CHECK (Population >= 0) |
|       | Latitude   | decimal     | CHECK (Latitude BETWEEN -90 AND 90) |
|       | Longitude  | decimal     | CHECK (Longitude BETWEEN -180 AND 180) |
|       | Elevation  | decimal     |  |

## 3. Province

| PK/FK | Atributo   | Tipo        | Restricciones |
|-------|------------|-------------|----------------|
| PK    | Name       | varchar(50) | NOT NULL |
| PK/FK | Country    | varchar(4)  | NOT NULL |
|       | Population | decimal     | CHECK (Population >= 0) |
|       | Area       | decimal     | CHECK (Area >= 0) |
|       | Capital    | varchar(50) |  |
|       | CapProv    | varchar(50) |  |

## 4. Economy

| PK/FK | Atributo    | Tipo        | Restricciones |
|-------|-------------|-------------|----------------|
| PK/FK | Country     | varchar(4)  | NOT NULL |
|       | GDP         | decimal     | CHECK (GDP >= 0) |
|       | Agriculture | decimal     |  |
|       | Service     | decimal     |  |
|       | Industry    | decimal     |  |
|       | Inflation   | decimal     |  |
|       | Unemployment| decimal     |  |

## 5. Population

| PK/FK | Atributo         | Tipo       | Restricciones |
|-------|------------------|------------|----------------|
| PK/FK | Country          | varchar(4) | NOT NULL |
|       | Population_Growth| decimal    |  |
|       | Infant_Mortality | decimal    |  |

## 6. Politics

| PK/FK | Atributo     | Tipo        | Restricciones |
|-------|--------------|-------------|----------------|
| PK/FK | Country      | varchar(4)  | NOT NULL |
|       | Independence | date        |  |
|       | WasDependent | varchar(50) |  |
| FK    | Dependent    | varchar(4)  |  |
|       | Government   | varchar(120)|  |

## 7. Religion

| PK/FK | Atributo   | Tipo        | Restricción                                           |
|-------|------------|-------------|-------------------------------------------------------|
| PK/FK | Country    | varchar(4)  | PK (Name, Country) / FK → Country(Code)              |
| PK    | Name       | varchar(50) | PK (Name, Country)                                    |
| —     | Percentage | decimal     | CHECK (Percentage > 0 AND Percentage <= 100)         |

---

## 8. EthnicGroup

| PK/FK | Atributo   | Tipo        | Restricción                                           |
|-------|------------|-------------|-------------------------------------------------------|
| PK/FK | Country    | varchar(4)  | PK (Name, Country) / FK → Country(Code)              |
| PK    | Name       | varchar(50) | PK (Name, Country)                                    |
| —     | Percentage | decimal     | CHECK (Percentage > 0 AND Percentage <= 100)         |

---

## 9. Language

| PK/FK | Atributo   | Tipo        | Restricción                                           |
|-------|------------|-------------|-------------------------------------------------------|
| PK/FK | Country    | varchar(4)  | PK (Name, Country) / FK → Country(Code)              |
| PK    | Name       | varchar(50) | PK (Name, Country)                                    |
| —     | Percentage | decimal     | CHECK (Percentage > 0 AND Percentage <= 100)         |

---

## 10. Sublanguage

| PK/FK | Atributo | Tipo        | Restricción |
|-------|----------|-------------|-------------|
| PK    | Sublang  | varchar(50) | —           |
| —     | Suplang  | varchar(50) | —           |

---

## 11. Countrypops

| PK/FK | Atributo   | Tipo        | Restricción                      |
|-------|------------|-------------|----------------------------------|
| PK/FK | Country    | varchar(4)  | FK → Country(Code)               |
| PK    | Year       | decimal     | CHECK (Year ≥ 0)                 |
| —     | Population | decimal     | CHECK (Population ≥ 0)           |

---

## 12. Countryothername

| PK/FK | Atributo  | Tipo        | Restricción |
|-------|-----------|-------------|-------------|
| PK/FK | Country   | varchar(4)  | FK → Country(Code) |
| PK    | othername | varchar(50) | —           |

---

## 13. Countrylocalname

| PK/FK | Atributo  | Tipo         | Restricción |
|-------|-----------|--------------|-------------|
| PK/FK | Country   | varchar(4)   | FK → Country(Code) |
| —     | localname | varchar(300) | —           |

## 14. Provpops

| PK/FK | Atributo   | Tipo        | Restricción                      |
|-------|------------|-------------|----------------------------------|
| PK/FK | Province   | varchar(50) | FK → Province(Name, Country)     |
| PK/FK | Country    | varchar(4)  | FK → Country(Code)               |
| PK    | Year       | decimal     | CHECK (Year ≥ 0)                 |
| —     | Population | decimal     | CHECK (Population ≥ 0)           |

---

## 15. Provinceothername

| PK/FK | Atributo   | Tipo        | Restricción                  |
|-------|------------|-------------|------------------------------|
| PK/FK | Province   | varchar(50) | FK → Province(Name, Country) |
| PK/FK | Country    | varchar(4)  | FK → Country(Code)           |
| PK    | othername  | varchar(50) | —                            |

---

## 16. Provincelocalname

| PK/FK | Atributo  | Tipo         | Restricción                  |
|-------|-----------|--------------|------------------------------|
| PK/FK | Province  | varchar(50)  | FK → Province(Name, Country) |
| PK/FK | Country   | varchar(4)   | FK → Country(Code)           |
| —     | localname | varchar(300) | —                            |

---

## 17. Citypops

| PK/FK | Atributo   | Tipo        | Restricción                    |
|-------|------------|-------------|--------------------------------|
| PK/FK | City       | varchar(50) | FK → City(Name, Country, Province) |
| PK/FK | Country    | varchar(4)  | FK → Country(Code)             |
| PK/FK | Province   | varchar(50) | FK → Province(Name, Country)   |
| PK    | Year       | decimal     | CHECK (Year ≥ 0)               |
| —     | Population | decimal     | CHECK (Population ≥ 0)         |

---

## 18. Cityothername

| PK/FK | Atributo   | Tipo        | Restricción                    |
|-------|------------|-------------|--------------------------------|
| PK/FK | City       | varchar(50) | FK → City(Name, Country, Province) |
| PK/FK | Country    | varchar(4)  | FK → Country(Code)             |
| PK/FK | Province   | varchar(50) | FK → Province(Name, Country)   |
| PK    | othername  | varchar(50) | —                              |

---

## 19. Citylocalname

| PK/FK | Atributo  | Tipo         | Restricción                    |
|-------|-----------|--------------|--------------------------------|
| PK/FK | City      | varchar(50)  | FK → City(Name, Country, Province) |
| PK/FK | Country   | varchar(4)   | FK → Country(Code)             |
| PK/FK | Province  | varchar(50)  | FK → Province(Name, Country)   |
| —     | localname | varchar(300) | —                              |

## 20. Continent

| PK/FK | Atributo | Tipo        | Restricción |
|-------|----------|-------------|-------------|
| PK    | Name     | varchar(20) | —           |
| —     | Area     | decimal(10) | —           |

---

## 21. borders

| PK/FK | Atributo | Tipo       | Restricción                             |
|-------|----------|------------|-----------------------------------------|
| PK/FK | Country1 | varchar(4) | FK → Country(Code)                      |
| PK/FK | Country2 | varchar(4) | FK → Country(Code)                      |
| —     | Length   | decimal    | CHECK (Length > 0)                      |

---

## 22. encompasses

| PK/FK | Atributo  | Tipo        | Restricción                              |
|-------|-----------|-------------|-------------------------------------------|
| PK/FK | Country   | varchar(4)  | NOT NULL, FK → Country(Code)              |
| PK/FK | Continent | varchar(20) | NOT NULL, FK → Continent(Name)            |
| —     | Percentage| decimal     | CHECK (Percentage > 0 AND Percentage ≤ 100) |

---

## 23. Organization

| PK/FK | Atributo     | Tipo         | Restricción                          |
|-------|--------------|--------------|--------------------------------------|
| PK    | Abbreviation | varchar(12)  | —                                    |
| —     | Name         | varchar(100) | UNIQUE                               |
| —     | City         | varchar(50)  | —                                    |
| FK    | Country      | varchar(4)   | FK → Country(Code)                   |
| FK    | Province     | varchar(50)  | FK → Province(Name, Country)         |
| —     | Established  | date         | —                                    |

---

## 24. isMember

| PK/FK | Atributo     | Tipo        | Restricción                         |
|-------|--------------|-------------|-------------------------------------|
| PK/FK | Country      | varchar(4)  | FK → Country(Code)                  |
| PK/FK | Organization | varchar(12) | FK → Organization(Abbreviation)     |
| —     | Type         | varchar(60) | DEFAULT 'member'                    |

---

## 25. Mountain

| PK/FK | Atributo    | Tipo       | Restricción                                                                                                                 |
|-------|-------------|------------|-----------------------------------------------------------------------------------------------------------------------------|
| PK    | Name        | varchar(50)| —                                                                                                                           |
| —     | Mountains   | varchar(50)| —                                                                                                                           |
| —     | Elevation   | decimal    | —                                                                                                                           |
| —     | Type        | varchar(10)| —                                                                                                                           |
| —     | Coordinates | GeoCoord   | CHECK ((Coordinates.Latitude ≥ -90 AND Coordinates.Latitude ≤ 90) AND (Coordinates.Longitude > -180 AND Coordinates.Longitude ≤ 180)) |

## 26. Desert

| PK/FK | Atributo    | Tipo     | Restricción                                                                                                               |
|-------|-------------|----------|---------------------------------------------------------------------------------------------------------------------------|
| PK    | Name        | varchar(50) | —                                                                                                                        |
| —     | Area        | decimal     | —                                                                                                                        |
| —     | Coordinates | GeoCoord    | CHECK ((Coordinates.Latitude ≥ -90 AND Coordinates.Latitude ≤ 90) AND (Coordinates.Longitude > -180 AND Coordinates.Longitude ≤ 180)) |

---

## 27. Island

| PK/FK | Atributo    | Tipo        | Restricción                                                                                                               |
|-------|-------------|-------------|---------------------------------------------------------------------------------------------------------------------------|
| PK    | Name        | varchar(50) | —                                                                                                                         |
| —     | Islands     | varchar(50) | —                                                                                                                         |
| —     | Area        | decimal     | CHECK (Area ≥ 0)                                                                                                          |
| —     | Elevation   | decimal     | —                                                                                                                         |
| —     | Type        | varchar(15) | —                                                                                                                         |
| —     | Coordinates | GeoCoord    | CHECK ((Coordinates.Latitude ≥ -90 AND Coordinates.Latitude ≤ 90) AND (Coordinates.Longitude > -180 AND Coordinates.Longitude ≤ 180)) |

---

## 28. Lake

| PK/FK | Atributo    | Tipo        | Restricción                                                                                                               |
|-------|-------------|-------------|---------------------------------------------------------------------------------------------------------------------------|
| PK    | Name        | varchar(50) | —                                                                                                                         |
| FK    | River       | varchar(50) | FK → River(Name)                                                                                                         |
| —     | Area        | decimal     | CHECK (Area ≥ 0)                                                                                                          |
| —     | Elevation   | decimal     | —                                                                                                                         |
| —     | Depth       | decimal     | CHECK (Depth ≥ 0)                                                                                                         |
| —     | Height      | decimal     | CHECK (Height > 0)                                                                                                        |
| —     | Type        | varchar(12) | —                                                                                                                         |
| —     | Coordinates | GeoCoord    | CHECK ((Coordinates.Latitude ≥ -90 AND Coordinates.Latitude ≤ 90) AND (Coordinates.Longitude > -180 AND Coordinates.Longitude ≤ 180)) |

---

## 29. Sea

| PK/FK | Atributo | Tipo        | Restricción              |
|-------|----------|-------------|--------------------------|
| PK    | Name     | varchar(50) | —                        |
| —     | Area     | decimal     | CHECK (Area ≥ 0)         |
| —     | Depth    | decimal     | CHECK (Depth ≥ 0)        |

---

## 30. River

| PK/FK | Atributo         | Tipo      | Restricción                                                                                                                                                                |
|-------|------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| PK    | Name             | varchar(50) | —                                                                                                                                                                           |
| FK    | River            | varchar(50) | FK → River(Name) (autorreferencia)                                                                                                                                          |
| FK    | Lake             | varchar(50) | FK → Lake(Name)                                                                                                                                                             |
| FK    | Sea              | varchar(50) | FK → Sea(Name)                                                                                                                                                              |
| —     | Length           | decimal     | CHECK (Length ≥ 0)                                                                                                                                                          |
| —     | Area             | decimal     | CHECK (Area ≥ 0)                                                                                                                                                            |
| —     | Source           | GeoCoord    | CHECK ((Source.Latitude ≥ -90 AND Source.Latitude ≤ 90) AND (Source.Longitude > -180 AND Source.Longitude ≤ 180))                                                          |
| —     | Mountains        | varchar(50) | —                                                                                                                                                                           |
| —     | SourceElevation  | decimal     | —                                                                                                                                                                           |
| —     | Estuary          | GeoCoord    | CHECK ((Estuary.Latitude ≥ -90 AND Estuary.Latitude ≤ 90) AND (Estuary.Longitude > -180 AND Estuary.Longitude ≤ 180))                                                      |
| —     | EstuaryElevation | decimal     | —                                                                                                                                                                           |
| —     | RivFlowsInto     | —           | CHECK ((River IS NULL AND Lake IS NULL) OR (River IS NULL AND Sea IS NULL) OR (Lake IS NULL AND Sea IS NULL))                                        |

---

## 31. RiverThrough

| PK/FK | Atributo | Tipo        | Restricción       |
|-------|----------|-------------|-------------------|
| PK/FK | River    | varchar(50) | FK → River(Name)  |
| PK/FK | Lake     | varchar(50) | FK → Lake(Name)   |

## 32. geo_Mountain

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | Mountain | varchar(50) | FK → Mountain(Name)                 |
| PK/FK | Country  | varchar(4)  | FK → Country(Code)                  |
| PK/FK | Province | varchar(50) | FK → Province(Name, Country)        |

---

## 33. geo_Desert

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | Desert   | varchar(50) | FK → Desert(Name)                   |
| PK/FK | Country  | varchar(4)  | FK → Country(Code)                  |
| PK/FK | Province | varchar(50) | FK → Province(Name, Country)        |

---

## 34. geo_Island

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | Island   | varchar(50) | FK → Island(Name)                   |
| PK/FK | Country  | varchar(4)  | FK → Country(Code)                  |
| PK/FK | Province | varchar(50) | FK → Province(Name, Country)        |

---

## 35. geo_River

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | River    | varchar(50) | FK → River(Name)                    |
| PK/FK | Country  | varchar(4)  | FK → Country(Code)                  |
| PK/FK | Province | varchar(50) | FK → Province(Name, Country)        |

---

## 36. geo_Sea

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | Sea      | varchar(50) | FK → Sea(Name)                      |
| PK/FK | Country  | varchar(4)  | FK → Country(Code)                  |
| PK/FK | Province | varchar(50) | FK → Province(Name, Country)        |

---

## 37. geo_Lake

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | Lake     | varchar(50) | FK → Lake(Name)                     |
| PK/FK | Country  | varchar(4)  | FK → Country(Code)                  |
| PK/FK | Province | varchar(50) | FK → Province(Name, Country)        |

## 38. geo_Source

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | River    | varchar(50) | FK → River(Name)                    |
| PK/FK | Country  | varchar(4)  | FK → Country(Code)                  |
| PK/FK | Province | varchar(50) | FK → Province(Name, Country)        |

---

## 39. geo_Estuary

| PK/FK | Atributo | Tipo        | Restricción                         |
|-------|----------|-------------|-------------------------------------|
| PK/FK | River    | varchar(50) | FK → River(Name)                    |
| PK/FK | Country  | varchar(4)  | FK → Country(Code)                  |
| PK/FK | Province | varchar(50) | FK → Province(Name, Country)        |

---

## 40. mergesWith

| PK/FK | Atributo | Tipo        | Restricción                   |
|-------|----------|-------------|-------------------------------|
| PK/FK | Sea1     | varchar(50) | FK → Sea(Name)                |
| PK/FK | Sea2     | varchar(50) | FK → Sea(Name)                |

---

## 41. located

| PK/FK | Atributo | Tipo        | Restricción                             |
|-------|----------|-------------|-------------------------------------------|
| FK    | City     | varchar(50) | FK → City(Name, Country, Province)        |
| FK    | Province | varchar(50) | FK → Province(Name, Country)              |
| FK    | Country  | varchar(4)  | FK → Country(Code)                        |
| FK    | River    | varchar(50) | FK → River(Name)                          |
| FK    | Lake     | varchar(50) | FK → Lake(Name)                           |
| FK    | Sea      | varchar(50) | FK → Sea(Name)                            |

> *Nota:* Esta tabla no tiene PK definido explícitamente en el DDL.

---

## 42. locatedOn

| PK/FK | Atributo | Tipo        | Restricción                             |
|-------|----------|-------------|-------------------------------------------|
| PK/FK | City     | varchar(50) | FK → City(Name, Country, Province)        |
| PK/FK | Province | varchar(50) | FK → Province(Name, Country)              |
| PK/FK | Country  | varchar(4)  | FK → Country(Code)                        |
| PK/FK | Island   | varchar(50) | FK → Island(Name)                         |

---

## 43. islandIn

| PK/FK | Atributo | Tipo        | Restricción                   |
|-------|----------|-------------|-------------------------------|
| FK    | Island   | varchar(50) | FK → Island(Name)             |
| FK    | Sea      | varchar(50) | FK → Sea(Name)                |
| FK    | Lake     | varchar(50) | FK → Lake(Name)               |
| FK    | River    | varchar(50) | FK → River(Name)              |

> *Nota:* Igual que *located*, esta tabla no define PK en el DDL.

## 44. MountainOnIsland

| PK/FK | Atributo | Tipo        | Restricción                |
|-------|----------|-------------|----------------------------|
| PK/FK | Mountain | varchar(50) | FK → Mountain(Name)        |
| PK/FK | Island   | varchar(50) | FK → Island(Name)          |

---

## 45. LakeOnIsland

| PK/FK | Atributo | Tipo        | Restricción             |
|-------|----------|-------------|-------------------------|
| PK/FK | Lake     | varchar(50) | FK → Lake(Name)         |
| PK/FK | Island   | varchar(50) | FK → Island(Name)       |

---

## 46. RiverOnIsland

| PK/FK | Atributo | Tipo        | Restricción            |
|-------|----------|-------------|------------------------|
| PK/FK | River    | varchar(50) | FK → River(Name)       |
| PK/FK | Island   | varchar(50) | FK → Island(Name)      |

---

## 47. Airport

| PK/FK | Atributo  | Tipo         | Restricción                                                                 |
|-------|-----------|--------------|-----------------------------------------------------------------------------|
| PK    | IATACode  | varchar(3)   | —                                                                           |
| —     | Name      | varchar(100) | —                                                                           |
| FK    | Country   | varchar(4)   | FK → Country(Code)                                                          |
| FK    | City      | varchar(50)  | FK → City(Name, Country, Province)*                                         |
| FK    | Province  | varchar(50)  | FK → Province(Name, Country)                                                |
| FK    | Island    | varchar(50)  | FK → Island(Name)                                                           |
| —     | Latitude  | decimal      | CHECK (Latitude ≥ -90 AND Latitude ≤ 90)                                    |
| —     | Longitude | decimal      | CHECK (Longitude ≥ -180 AND Longitude ≤ 180)                                |
| —     | Elevation | decimal      | —                                                                           |
| —     | gmtOffset | decimal      | —                                                                           |

> *El FK hacia City requiere los tres atributos (Name, Country, Province), pero la tabla Airport sólo incluye "City", "Country", "Province", por lo cual la referencia es válida como combinación.*
