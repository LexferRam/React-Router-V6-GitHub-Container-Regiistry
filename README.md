# React Router V6

```javascript
// Switch ==> Routes
// Redicrect ==> Navigate
// useHistory ==> useNavigate 
<Route path='/about' component={AboutPage} /> ==> <Route path='/about' element={<AboutPage />} />
//Outlet ==> indica donde se pintara el componete de una subruta(hace referencia al children  )
```

## PASOS PARA SUBIR IMAGENES A GITHUB CONTAINER REGISTRY

1. Hacer login desde la terminal con GitHub Container(en password colocar el token de token):

```npm
docker login ghcr.io --username github-account
[Paste your GitHub token on this prompt]
```

2. Colocar tag a la imagen de GitHub
   (github-account se debe colocar en minuscula 'lexferram')

```npm
docker tag image-id ghcr.io/github-account/image-name:image-version
```

3. Hacer push de la imagen creada:

```npm
docker push ghcr.io/lexferram/react-router-v6:1.6
```
4. Para hacer pull de la imagen:

```npm
docker pull ghcr.io/lexferram/reactrouterv6:1.6
```

5. Para conectar automaticamente una imagen de docker a un repo de github.

**NOTA:** Para que una imagen se suba directamente asociada a un repositorio al construir la imagen debe tener la siguiente estructura:

```npm
ghcr.io/lexferram/react-router-v6:1.2
```

* donde lexferram ===> propietario
* react-router-v6 ===> nombre del repositorio al que se quiere asociar la imagen
* 1.2 ===> version de la imagen